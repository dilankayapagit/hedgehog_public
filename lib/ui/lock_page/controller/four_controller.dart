import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/model/folder_custom_model.dart';
import 'package:hedgehog_lock/services/get_objects_controller.dart';

import '../../../model/file_custom_model.dart';

class LockPageController extends GetxController {
  var getObjectsController = Get.find<GetObjectsController>();

  Future<bool> lockFile(FileCustomModel? fileUploadModel) async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var ref = FirebaseFirestore.instance.collection("users/$userId/files");

      await ref.doc(fileUploadModel!.fileId).set(
          fileUploadModel.toMap(),
          SetOptions(
            merge: true,
          ));
    } catch (e) {
      log(e.toString());
    }
    return true;
  }

  Future<bool> changefolder(FileCustomModel? fileUploadModel,
      FolderCustomModel? folderUploadModel) async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var ref = FirebaseFirestore.instance.collection("users/$userId/files");
      await ref.doc(fileUploadModel!.fileId).set(
            fileUploadModel
                .copyWith(parentId: folderUploadModel!.folderId)
                .toMap(),
            SetOptions(
              merge: true,
            ),
          );
    } catch (e) {
      log("changefolder " + e.toString());
    }

    return true;
  }

  Future<String?> deleteFolder(String folderId) async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var ref = FirebaseFirestore.instance.collection("users/$userId/folders");
      await ref.doc(folderId).delete();
      return "done";
    } catch (e) {
      log(e.toString());
    }
    return "";
  }

  Future<String> createFolder(FolderCustomModel folderUploadModel) async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var ref = FirebaseFirestore.instance.collection("users/$userId/folders");

      return await ref
          .add(folderUploadModel
              .copyWith(
                parentId: userId,
                isDeleted: false,
                createdAt: FieldValue.serverTimestamp(),
                updatedAt: FieldValue.serverTimestamp(),
              )
              .toMap())
          .then((value) {
        getObjectsController.getFolders();

        return value.id;
      });
    } catch (e) {
      log(e.toString());
    }
    return "";
  }

  Future<bool> renameFolder(FolderCustomModel folderUploadModel) async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var ref = FirebaseFirestore.instance.collection("users/$userId/folders");

      await ref.doc(folderUploadModel.folderId).set(
          folderUploadModel.toMap(),
          SetOptions(
            merge: true,
          ));
    } catch (e) {
      log(e.toString());
    }
    return true;
  }

  Future<bool> renameFile(FileCustomModel? fileUploadModel) async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var ref = FirebaseFirestore.instance.collection("users/$userId/files");

      await ref.doc(fileUploadModel!.fileId).set(
          fileUploadModel.toMap(),
          SetOptions(
            merge: true,
          ));
    } catch (e) {
      log(e.toString());
    }
    return true;
  }
}
