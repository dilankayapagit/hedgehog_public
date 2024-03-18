import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:flutter/material.dart';

class EightController extends GetxController {
  TextEditingController oldPw = TextEditingController();

  TextEditingController newPw = TextEditingController();

  Future<bool> changePassword() async {
    if (oldPw.value.text == "" ||
        newPw.value.text == "" ||
        FirebaseAuth.instance.currentUser!.isAnonymous) {
      Fluttertoast.showToast(
          msg: "Old or New or both passwords empty or Login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    Get.back();

    try {
      AuthCredential credential = EmailAuthProvider.credential(
          email: FirebaseAuth.instance.currentUser!.email ?? "",
          password: oldPw.text);

      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);
      await FirebaseAuth.instance.currentUser!.updatePassword(newPw.text);
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

    return true;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    oldPw.dispose();
    newPw.dispose();
  }
}
