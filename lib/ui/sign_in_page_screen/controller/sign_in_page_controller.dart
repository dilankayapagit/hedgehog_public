import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../services/auth_controller.dart';
import '../../../services/get_objects_controller.dart';

class SignInPageController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  RxBool checkbox = false.obs;

  Rx<bool> isShowPassword = false.obs;
  var athController = Get.put(AuthController());
  var getObjectsController = Get.put(GetObjectsController());

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<bool> signInWithApple() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      athController.createUserDb();
      getObjectsController.getFiles();
      getObjectsController.getFolders();
      Get.offNamed(AppRoutes.homeMenuContainerScreen);
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

  signInGmail() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        athController.createUserDb();
        getObjectsController.getFiles();
        getObjectsController.getFolders();
        Get.offNamed(AppRoutes.homeMenuContainerScreen);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  signInAnon() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      athController.createUserDb();
      getObjectsController.getFiles();
      getObjectsController.getFolders();
      Get.offNamed(AppRoutes.homeMenuContainerScreen);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      athController.createUserDb();
      getObjectsController.getFiles();
      getObjectsController.getFolders();
      Get.offNamed(AppRoutes.homeMenuContainerScreen);
      debugPrint("done sign in");
    } catch (e) {
      debugPrint(e.toString());
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      athController.createUserDb();
      getObjectsController.getFiles();
      getObjectsController.getFolders();
      Get.offNamed(AppRoutes.homeMenuContainerScreen);
      debugPrint("done sign up");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
