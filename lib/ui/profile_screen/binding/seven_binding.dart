import '../controller/seven_controller.dart';
import 'package:get/get.dart';

class SevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SevenController());
  }
}
