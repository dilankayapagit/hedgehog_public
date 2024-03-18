import '../controller/seventeen_controller.dart';
import 'package:get/get.dart';

class SeventeenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeventeenController());
  }
}
