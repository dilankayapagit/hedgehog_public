import '../controller/eleven_controller.dart';
import 'package:get/get.dart';

class ElevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ElevenController());
  }
}
