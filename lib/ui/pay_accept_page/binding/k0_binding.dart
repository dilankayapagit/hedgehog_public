import '../controller/k0_controller.dart';
import 'package:get/get.dart';

class K0Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => K0Controller());
  }
}
