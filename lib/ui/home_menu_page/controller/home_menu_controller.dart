import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import '../../../model/file_custom_model.dart';
import '../../../model/upload_model_file.dart';
import '../../../services/auth_controller.dart';
import '../../../services/get_objects_controller.dart';

class HomeMenuController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var getObjectsController = Get.find<GetObjectsController>();
  var authController = Get.find<AuthController>();
  StreamSubscription? _intentDataStreamSubscription;

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  quickUpload(String path) async {
    final user = FirebaseAuth.instance.currentUser;
    var file = File(path);
    // log(path.split("/").last);
    Get.defaultDialog(
      title: "Upload File To IPFS",
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: Image.file(
              file,
              width: 250,
              height: 250,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () async {
              await createFile(
                FileCustomModel(
                  parentId: user!.uid,
                  fileName: path.split("/").last,
                  file: file,
                  fileType: path.split("/").last.split(".").last,
                ),
              );
              Get.back();
            },
            child: Text("Upload"),
          ),
        ],
      ),
    );
  }

  Future<bool> setAvailableSize(int size) async {
    try {
      var colloection = FirebaseFirestore.instance.collection("users");
      var userId = FirebaseAuth.instance.currentUser!.uid;
      await colloection.doc(userId).set(
        {
          "storageUsedBytes":
              authController.userCustomModel.value.storageUsedBytes! + size,
          "updatedAt": FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
      authController.getUserDetails();
    } catch (e) {
      log(e.toString());
      return false;
    } finally {
      update();
    }
    return true;
  }

  Future<UploadModelFile?> uploadIpfs(File file) async {
    try {
      var request = http.MultipartRequest(
          "POST", Uri.parse("${Constants.server}/upload"));

      var fileRequest = await http.MultipartFile.fromPath(
        'file',
        file.path,
      );
      request.files.add(fileRequest);

      var response = await request.send();
      final respStr = await response.stream.bytesToString();

      log(UploadModelFile.fromMap(json.decode(respStr.toString()))
          .copyWith(size: file.lengthSync())
          .toMap()
          .toString());

      return UploadModelFile.fromMap(json.decode(respStr.toString()))
          .copyWith(size: file.lengthSync());
    } catch (e) {
      log(e.toString());
    }

    return null;
  }

  Future<String> createFile(FileCustomModel fileUploadModel) async {
    Get.defaultDialog(
        title: "Uploading.",
        content: CircularProgressIndicator(),
        barrierDismissible: false);
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var ref = FirebaseFirestore.instance.collection("users/$userId/files");
      UploadModelFile? uploadResponseModel =
          await uploadIpfs(fileUploadModel.file);

      if (uploadResponseModel != null) {
        await ref
            .add(fileUploadModel
                .copyWith(
                  cId: uploadResponseModel.hash!.path,
                  isDeleted: false,
                  parentId: fileUploadModel.parentId == null
                      ? userId
                      : fileUploadModel.parentId,
                  file: "",
                  fileUrl:
                      "${Constants.urlGetFile}${uploadResponseModel.hash!.path}",
                  fileSize: uploadResponseModel.size.toString(),
                  createdAt: FieldValue.serverTimestamp(),
                  updatedAt: FieldValue.serverTimestamp(),
                  isPinned: false,
                )
                .toMap())
            .then((value) async {
          await getObjectsController.getFiles();
        });
      }
    } catch (e) {
      log(e.toString());
    } finally {
      Get.back();
    }
    return "";
  }

  bool isUploadPossible(int size) {
    if (authController.userCustomModel.value.storageUsedBytes! + size >
        authController.userCustomModel.value.payPackage.storageBytes) {
      Fluttertoast.showToast(
          msg: "Please Upgrade Storage",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    setAvailableSize(size);
    return true;
  }

  cameraUpload() async {
    final user = FirebaseAuth.instance.currentUser;

    if (!user!.isAnonymous) {
      final XFile? file = await _picker.pickImage(source: ImageSource.camera);
      if (file != null && isUploadPossible(await file.length())) {
        createFile(
          FileCustomModel(
            fileName: file.name,
            file: File(file.path),
            fileType: file.name.split(".").last,
          ),
        );
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please Sign In",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  videoUpload() async {
    final user = FirebaseAuth.instance.currentUser;

    if (!user!.isAnonymous) {
      FilePickerResult? file = await FilePicker.platform.pickFiles(
        type: FileType.video,
      );
      if (file != null && isUploadPossible(file.files.single.size)) {
        createFile(
          FileCustomModel(
            fileName: file.files.single.name,
            file: File(file.files.single.path ?? ""),
            fileType: file.files.single.name.split(".").last,
          ),
        );
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please Sign In",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  imgUpload() async {
    final user = FirebaseAuth.instance.currentUser;

    if (!user!.isAnonymous) {
      FilePickerResult? file = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (file != null && isUploadPossible(file.files.single.size)) {
        createFile(
          FileCustomModel(
            fileName: file.files.single.name,
            file: File(file.files.single.path ?? ""),
            fileType: file.files.single.name.split(".").last,
          ),
        );
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please Sign In",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<bool> fileUpload({String? parentId}) async {
    final user = FirebaseAuth.instance.currentUser;

    if (!user!.isAnonymous) {
      FilePickerResult? file = await FilePicker.platform.pickFiles();
      if (file != null && isUploadPossible(file.files.single.size)) {
        await createFile(
          FileCustomModel(
            parentId: parentId,
            fileName: file.files.single.name,
            file: File(file.files.single.path ?? ""),
            fileType: file.files.single.name.split(".").last,
          ),
        );
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please Sign In",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return true;
  }

  String getUrlPhoto() {
    if (FirebaseAuth.instance.currentUser == null) return "";
    var url = "";
    try {
      url = FirebaseAuth.instance.currentUser!.photoURL ?? "";
    } catch (e) {}
    return url;
  }

  String getName() {
    if (FirebaseAuth.instance.currentUser == null) return "No user";

    final user = FirebaseAuth.instance.currentUser;
    return user != null
        ? user.isAnonymous
            ? "Anonymous"
            : user.displayName ?? user.email!.split("@")[0]
        : "No user";
  }

  reciveFiles() async {
    if (FirebaseAuth.instance.currentUser == null) return;

    if (FirebaseAuth.instance.currentUser!.isAnonymous) return;
    if (Platform.isIOS) {
      await Permission.storage.request();
      await Permission.accessMediaLocation.request();
    } else {
      await Permission.photos.request();
    }

    final user = FirebaseAuth.instance.currentUser;

    if (user != null && !(user.isAnonymous)) {
      try {
        _intentDataStreamSubscription = ReceiveSharingIntent.getMediaStream()
            .listen((List<SharedMediaFile> value) {
          if (value.map((f) => f.path).join(",") != "") {
            if (['jpg', 'png', 'jpeg'].contains(
              (value.map((f) => f.path).join(","))
                  .split("/")
                  .last
                  .split(".")
                  .last,
            )) {
              quickUpload(value.map((f) => f.path).join(","));
            } else {
              Fluttertoast.showToast(
                  msg: "Image Files Only",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        }, onError: (err) {
          print("getIntentDataStream error: $err");
        });

        ReceiveSharingIntent.getInitialMedia()
            .then((List<SharedMediaFile> value) {
          if (value.map((f) => f.path).join(",") != "") {
            if (['jpg', 'png', 'jpeg'].contains(
              (value.map((f) => f.path).join(","))
                  .split("/")
                  .last
                  .split(".")
                  .last,
            )) {
              quickUpload(value.map((f) => f.path).join(","));
            } else {
              Fluttertoast.showToast(
                  msg: "Quick Upload Image Files Only",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        });
      } catch (e) {
        log("Errorrr" + e.toString());
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    try {
      if (_intentDataStreamSubscription != null) {
        _intentDataStreamSubscription!.cancel();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
