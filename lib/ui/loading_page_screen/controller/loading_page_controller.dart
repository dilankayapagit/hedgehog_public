import 'package:firebase_auth/firebase_auth.dart';
import 'package:hedgehog_lock/core/app_export.dart';

import '../../../services/auth_controller.dart';
import '../../../services/payemnt_controller.dart';

class LoadingPageController extends GetxController {
  var authController = Get.find<AuthController>();
  var paymentController = Get.find<PaymentController>();

  @override
  void onReady() {
    super.onReady();
    startUp();
  }

  startUp() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await authController.getUserDetails();
      await Future.delayed(const Duration(milliseconds: 2000), () {});
      await paymentController.getSubscribeStatus();

      Get.offAllNamed(AppRoutes.homeMenuContainerScreen);
    } else {
      await Future.delayed(const Duration(milliseconds: 2000), () {});

      Get.offAllNamed(AppRoutes.signInPageScreen);
    }
  }
}
