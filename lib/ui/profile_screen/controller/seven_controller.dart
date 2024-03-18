import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class SevenController extends GetxController {
  var profilePic = "".obs;
  var name = "No user".obs;

  changeName() async {
    try {
      var user = FirebaseAuth.instance.currentUser!;
      TextEditingController textEditingController = TextEditingController();
      if (!user.isAnonymous) {
        await Get.defaultDialog(
          title: getName(),
          content: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(label: Text("Enter New Name")),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () async {
                      await user.updateDisplayName(textEditingController.text);
                      name(textEditingController.text);
                      update();
                      Get.back();
                    },
                    child: Text("Save")),
              ],
            ),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  changeProfilePic() async {
    String dateTime = DateTime.now().toIso8601String();

    try {
      var user = FirebaseAuth.instance.currentUser!;
      final ImagePicker _picker = ImagePicker();

      if (await Permission.accessMediaLocation.isDenied) {
        await Permission.accessMediaLocation.request();
      }
      if (!user.isAnonymous) {
        XFile? file;
        await Get.defaultDialog(
          title: "Options",
          content: Column(
            children: [
              TextButton(
                  onPressed: () async {
                    file = await _picker.pickImage(source: ImageSource.camera);
                    Get.back();
                  },
                  child: Text("Camera")),
              TextButton(
                  onPressed: () async {
                    file = await _picker.pickImage(source: ImageSource.gallery);
                    Get.back();
                  },
                  child: Text("Gallery")),
            ],
          ),
        );

        if (file != null) {
          profilePic(file!.path);
          update();
          var firebaseStorage =
              FirebaseStorage.instance.ref("users/${dateTime + file!.name}");
          await firebaseStorage.putFile(File(file!.path));
          await user.updatePhotoURL(await firebaseStorage.getDownloadURL());
          update();
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      log(e.toString());
    }
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
    name(user != null
        ? user.isAnonymous
            ? "Anonymous"
            : user.displayName ?? user.email!.split("@")[0]
        : "No user");
    update();
    return name.value;
  }
}
