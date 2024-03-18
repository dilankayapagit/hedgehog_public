import '../controller/fourteen_controller.dart';
import 'package:get/get.dart';

class FourteenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FourteenController());
  }
}
