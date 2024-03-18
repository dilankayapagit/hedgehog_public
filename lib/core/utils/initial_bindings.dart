import 'package:hedgehog_lock/core/app_export.dart';

import '../../services/auth_controller.dart';
import '../../services/download_file_controller.dart';
import '../../services/get_objects_controller.dart';
import '../../services/payemnt_controller.dart';
import '../../ui/folder_page/controller/twenty_controller.dart';
import '../../ui/home_menu_page/controller/home_menu_controller.dart';
import '../../ui/lock_page/controller/four_controller.dart';
import '../../ui/lock_page/dialogs/folders_dialog_controllers.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GetObjectsController());
    Get.put(AuthController());
    Get.put(HomeMenuController());
    Get.put(PaymentController());
    Get.put(LockPageController());
    Get.put(DownloadFileController());
    Get.put(FolderPageController());
    Get.put(FoldersDialogController());
  }
}
