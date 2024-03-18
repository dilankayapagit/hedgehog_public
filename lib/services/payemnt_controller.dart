import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hedgehog_lock/constants/constants.dart';
import 'package:hedgehog_lock/ui/pay_accept_page/pay_accept_page.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'auth_controller.dart';

class PaymentController extends GetxController {
  final isSubscribe = false.obs;
  final box = GetStorage();

  var authController = Get.find<AuthController>();

  restorePurchases() async {
    Get.defaultDialog(
        title: "Restoring.",
        content: CircularProgressIndicator(),
        barrierDismissible: false);
    try {
      await Purchases.restorePurchases();
      await getSubscribeStatus();
    } catch (e) {
      log(e.toString());
    } finally {
      authController.getUserDetails();
      Get.back();
    }
  }

  makePurchases(int index) async {
    if (await getSubscribeStatus()) {
      return;
    }
    // var user = FirebaseAuth.instance.currentUser;
    // if (user!.isAnonymous) {
    //   Fluttertoast.showToast(
    //       msg: "To uplaod the data you have to Sign In",
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.red,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    //   //return;
    // }

    try {
      var offerings = await Purchases.getOfferings();
      final package = offerings.current!.availablePackages;
      //log(package.toString());
      CustomerInfo customerInfo =
          await Purchases.purchasePackage(package[index]);
      var isPro = customerInfo.entitlements.all["hedgehog_premium"]!.isActive;
      if (isPro) {
        isSubscribe(true);
        setPaymentPackage(Constants.payPackageModelList[index].payId ?? "");
        Get.to(PayAcceptPage(
          index: index,
        ));
      }
      await getSubscribeStatus();
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        log("message$e");
      }
    } catch (e) {
      log("message$e");
    } finally {
      authController.getUserDetails();
      update();
      // Get.back();
    }
  }

  Future<bool> getSubscribeStatus() async {
    bool isActive = false;
    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      if (customerInfo.entitlements.all["hedgehog_premium"] != null &&
          customerInfo.entitlements.all["hedgehog_premium"]!.isActive) {
        isSubscribe(true);
        isActive = true;
      } else {
        log("****" + customerInfo.toString());
        setPaymentPackage(Constants.payPackageModelList[3].payId ?? "");
        isSubscribe(false);
      }
    } catch (e) {
      log("message$e");
    } finally {
      authController.getUserDetails();
      update();
      // Get.back();
    }
    return isActive;
  }

  Future<bool> setPaymentPackage(String payPackageId) async {
    try {
      var colloection = FirebaseFirestore.instance.collection("users");
      var userId = FirebaseAuth.instance.currentUser!.uid;
      await colloection.doc(userId).set(
        {
          "payPackageId": payPackageId,
          "updatedAt": FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      log(e.toString());
      return false;
    } finally {
      authController.getUserDetails();
      update();
    }
    return true;
  }

  static Future<void> initPlatformState() async {
    await Purchases.setLogLevel(LogLevel.info);

    PurchasesConfiguration configuration;
    if (Platform.isAndroid) {
      configuration =
          PurchasesConfiguration("");
    } else {
      configuration =
          PurchasesConfiguration("");
    }
    await Purchases.configure(configuration);
  }
}
