import '../controller/sign_in_page_controller.dart';
import 'package:get/get.dart';

class SignInPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInPageController());
  }
}
