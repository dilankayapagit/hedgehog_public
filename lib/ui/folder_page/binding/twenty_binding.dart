import '../controller/twenty_controller.dart';
import 'package:get/get.dart';

class TwentyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FolderPageController());
  }
}
