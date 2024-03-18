import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hedgehog_lock/constants/constants.dart';
import 'package:hedgehog_lock/model/user_custom_model.dart';
import 'package:hedgehog_lock/services/payemnt_controller.dart';

class AuthController extends GetxController {
  var userCustomModel = UserCustomModel().obs;
  Future<bool> getUserDetails() async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var colloection = FirebaseFirestore.instance.collection("users");
      await colloection.doc(userId).get().then((document) {
        if (document.exists) {
          UserCustomModel userCustomModelTemp =
              UserCustomModel.fromMap(document.data() as Map<String, dynamic>);
          userCustomModel(userCustomModelTemp.copyWith(
            payPackage: Constants.getPayPackage(
              userCustomModelTemp.payPackageId ?? "",
            ),
          ));
        }
      });
    } catch (e) {
      log(e.toString());
    } finally {
      update();
    }
    return true;
  }

  Future<bool> createUserDb() async {
    if (await isAlreadyUser()) return true;
    try {
      var colloection = FirebaseFirestore.instance.collection("users");
      var userId = FirebaseAuth.instance.currentUser!.uid;
      await colloection.doc(userId).set(
            UserCustomModel(
              uerId: userId,
              storageUsedBytes: 0,
              payPackageId: "hedgehog_free",
              updatedAt: FieldValue.serverTimestamp(),
              createdAt: FieldValue.serverTimestamp(),
            ).toMap(),
            SetOptions(merge: true),
          );
      getUserDetails();
      var paymentController = Get.put(PaymentController());
      paymentController.restorePurchases();
    } catch (e) {
      log(e.toString());
      return false;
    } finally {
      update();
    }
    return true;
  }

  Future<bool> isAlreadyUser() async {
    bool isUser = false;
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;

      var colloection = FirebaseFirestore.instance.collection("users");
      await colloection.where("uerId", isEqualTo: userId).get().then(
        (query) {
          if (query.docs.length != 0) {
            isUser = true;
          }
        },
      );
    } catch (e) {
      log(e.toString());
      return false;
    }
    return isUser;
  }
}
