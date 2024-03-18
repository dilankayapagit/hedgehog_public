import 'dart:developer';

import 'package:hedgehog_lock/core/app_export.dart';

import '../../../model/file_custom_model.dart';
import '../../../model/folder_custom_model.dart';
import '../../../services/get_objects_controller.dart';

class FolderPageController extends GetxController {
  var getObjectsController = Get.find<GetObjectsController>();

  var folder = FolderCustomModel().obs;
  var searchFile = "".obs;
  var searchFileList = <FileCustomModel>[].obs;
  
  getFileSearchList() {
    var fileListTemp = <FileCustomModel>[];

    try {
      for (FileCustomModel element in getObjectsController.fileList) {
        if (element.parentId != folder.value.folderId) continue;
        if (element.fileName!.toLowerCase().contains(searchFile.value)) {
          fileListTemp.add(element);
        }
      }
    } catch (e) {
      log(e.toString());
    }
    searchFileList(fileListTemp);
    update();
  }

  setSearchFileVal(String st) {
    searchFile(st);
    getFileSearchList();
  }

  setFolder(FolderCustomModel folderUploadModel) {
    folder(folderUploadModel);
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
