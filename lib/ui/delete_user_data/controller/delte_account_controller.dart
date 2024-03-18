import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../services/get_objects_controller.dart';

class DeleteAccount extends GetxController {
  deleteAccount() async {
    var user = FirebaseAuth.instance.currentUser!;

    try {
      var colloection = FirebaseFirestore.instance.collection("users");

      var getObjectsController = Get.put(GetObjectsController());

      await getObjectsController.deleteAllData();

      await colloection.doc(user.uid).delete();
      user.delete();

      FirebaseAuth.instance.signOut();
      Get.offAllNamed(AppRoutes.signInPageScreen);
    } catch (e) {
      log(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
