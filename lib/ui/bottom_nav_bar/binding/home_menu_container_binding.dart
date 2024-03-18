import '../controller/home_menu_container_controller.dart';
import 'package:get/get.dart';

class HomeMenuContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeMenuContainerController());
  }
}
