import '../controller/thirteen_controller.dart';
import 'package:get/get.dart';

class ThirteenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThirteenController());
  }
}
