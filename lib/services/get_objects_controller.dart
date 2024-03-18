import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:http/http.dart' as http;

import '../model/file_custom_model.dart';
import '../model/folder_custom_model.dart';
import '../model/upload_model_file.dart';
import 'auth_controller.dart';

class GetObjectsController extends GetxController {
  //
  var fileList = <FileCustomModel>[].obs;
  var pinFileList = <FileCustomModel>[].obs;
//
  var searchFile = "".obs;
  var searchFileList = <FileCustomModel>[].obs;

//
  var folderList = <FolderCustomModel>[].obs;
  var searchFolder = "".obs;
  var searchFolderList = <FolderCustomModel>[].obs;
  var authController = Get.put(AuthController());

  //@override
  void onReady() {
    super.onReady();
    getFiles();
    getFolders();
  }

  Future<UploadModelFile?> pinPost(String hash) async {
    var client = http.Client();
    try {
      // var response = await client.post(
      //   Uri.https('${Constants.server}/file/pin'),
      //   body: {'hash': hash},
      // );
      var response = await client.post(
        Uri.https('${Constants.server}/file/pin'),
        body: {'hash': hash},
      );

      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      print(await client.get(uri));
    } finally {
      client.close();
    }

    return null;
  }

  Future<UploadModelFile?> unpinPost(String hash) async {
    var client = http.Client();
    try {
      // var response = await client.post(
      //   Uri.https('${Constants.server}/file/unpin'),
      //   body: {'hash': hash},
      // );

      var response = await client.post(
        Uri.https('${Constants.server}/file/unpin'),
        body: {'hash': hash},
      );
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var uri = Uri.parse(decodedResponse['uri'] as String);
      print(await client.get(uri));
    } finally {
      client.close();
    }

    return null;
  }

  Future<bool> deleteAllData() async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    var refFolder =
        FirebaseFirestore.instance.collection("users/$userId/folders");
    var refFiles = FirebaseFirestore.instance.collection("users/$userId/files");

    try {
      await refFolder.get().then((value) async {
        for (var doc in value.docs) {
          await deleteFolderWithFiles(doc.id);
        }
      });

      await refFiles.get().then((value) async {
        for (var doc in value.docs) {
          await deleteFile(doc.id);
        }
      });
    } catch (e) {
      log(e.toString());
    }
    return true;
  }

  Future<String?> deleteFolderWithFiles(String folderId) async {
    Get.defaultDialog(
        title: "Deleting.",
        content: CircularProgressIndicator(),
        barrierDismissible: false);

    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var refFolder =
          FirebaseFirestore.instance.collection("users/$userId/folders");
      var refFiles =
          FirebaseFirestore.instance.collection("users/$userId/files");
      var refFilesWhere = refFiles.where("parentId", isEqualTo: folderId);

      await refFolder.doc(folderId).delete();

      await refFilesWhere.get().then((docsList) async {
        for (var doc in docsList.docs) {
          var data = doc.data();
          await setDeleteAvailableSize(int.parse(data["fileSize"]));
          await refFiles.doc(doc.id).delete();
        }
      });

      return "done";
    } catch (e) {
      log("delete" + e.toString());
    } finally {
      Get.back();
    }

    return "";
  }

  Future<String?> deleteFolder(String folderId) async {
    Get.defaultDialog(
        title: "Deleting.",
        content: CircularProgressIndicator(),
        barrierDismissible: false);

    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var ref = FirebaseFirestore.instance.collection("users/$userId/folders");
      ref.doc(folderId).set({
        "isDeleted": true,
        "updatedAt": FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      //await ref.doc(fileId).delete();
      return "done";
    } catch (e) {
      log("delete" + e.toString());
    } finally {
      Get.back();
    }

    return "";
  }

  Future<bool> setDeleteAvailableSize(int size) async {
    try {
      var colloection = FirebaseFirestore.instance.collection("users");
      var userId = FirebaseAuth.instance.currentUser!.uid;
      await colloection.doc(userId).set(
        {
          "storageUsedBytes":
              authController.userCustomModel.value.storageUsedBytes! - size,
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

  Future<String?> deleteFile(String fileId) async {
    Get.defaultDialog(
        title: "Deleting.",
        content: CircularProgressIndicator(),
        barrierDismissible: false);

    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var ref = FirebaseFirestore.instance.collection("users/$userId/files");
      // ref.doc(fileId).set({
      //   "isDeleted": true,
      //   "updatedAt": FieldValue.serverTimestamp(),
      // }, SetOptions(merge: true));

      await ref.doc(fileId).delete();

      return "done";
    } catch (e) {
      log("delete" + e.toString());
    } finally {
      Get.back();
    }
    return "";
  }

  Future<String?> makePinned(String fileId, bool isPinned) async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var ref = FirebaseFirestore.instance.collection("users/$userId/files");
      if (isPinned) {
        unpinPost(fileId);
      } else {
        pinPost(fileId);
      }

      return await ref.doc(fileId).set({
        "isPinned": isPinned,
        "updatedAt": FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)).then((value) async {
        await getFiles();
        return "done";
      });
    } catch (e) {
      log(e.toString());
    }
    return "";
  }

  getFolderSearchList() {
    var searchFolderListTemp = <FolderCustomModel>[];

    try {
      for (FolderCustomModel element in folderList) {
        if (element.folderName!.toLowerCase().contains(searchFolder.value)) {
          searchFolderListTemp.add(element);
        }
      }
    } catch (e) {
      log(e.toString());
    }
    searchFolderList(searchFolderListTemp);
    update();
  }

  getFileSearchList() {
    var fileListTemp = <FileCustomModel>[];

    try {
      for (FileCustomModel element in fileList) {
        if (element.fileName!.toLowerCase().contains(searchFile.value)) {
          fileListTemp.add(element);
        }
      }
    } catch (e) {
      log(e.toString());
    }
    searchFileList(fileListTemp);

    update();
  }

  getFiles() async {
    fileList.clear();
    var fileListTemp = <FileCustomModel>[];
    var pinFileListTemp = <FileCustomModel>[];

    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;

      var ref = FirebaseFirestore.instance
          .collection("users/$userId/files")
          .where("isDeleted", isEqualTo: false)
          .orderBy("updatedAt", descending: true);

      await ref.get().then((quarys) {
        for (var documents in quarys.docs) {
          FileCustomModel fileUploadModel =
              FileCustomModel.fromMap(documents.data()).copyWith(
            fileId: documents.id,
          );
          fileListTemp.add(fileUploadModel);
          if (fileUploadModel.isPinned ?? false) {
            pinFileListTemp.add(fileUploadModel);
          }
        }
      });
    } catch (e) {
      log(e.toString());
    }
    fileList(fileListTemp);
    pinFileList(pinFileListTemp);

    getFileSearchList();
    update();
  }

  getFolders() async {
    folderList.clear();
    var folderListTemp = <FolderCustomModel>[];
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;

      var ref = FirebaseFirestore.instance
          .collection("users/$userId/folders")
          .where("isDeleted", isEqualTo: false)
          .orderBy("updatedAt", descending: true);

      await ref.get().then((quarys) {
        for (var documents in quarys.docs) {
          FolderCustomModel fileUploadModel =
              FolderCustomModel.fromMap(documents.data()).copyWith(
            folderId: documents.id,
          );

          folderListTemp.add(fileUploadModel);
        }
      });
    } catch (e) {}
    folderList(folderListTemp);
    getFolderSearchList();
    update();
  }

  setSearchFolder(String searchVal) {
    try {
      this.searchFolder(searchVal);
      getFolderSearchList();
    } catch (e) {
      log(e.toString());
    }
  }

  setSearchFile(String searchVal) {
    try {
      this.searchFile(searchVal);
      getFileSearchList();
    } catch (e) {
      log(e.toString());
    }
  }
}
