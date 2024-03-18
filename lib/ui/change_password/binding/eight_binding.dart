import '../controller/eight_controller.dart';
import 'package:get/get.dart';

class EightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EightController());
  }
}
