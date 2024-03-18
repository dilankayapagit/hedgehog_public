import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hedgehog_lock/core/app_export.dart';

import '../../../model/file_custom_model.dart';
import '../../../model/folder_custom_model.dart';
import '../../../services/download_file_controller.dart';
import '../../../services/get_objects_controller.dart';
import '../../folder_page/controller/twenty_controller.dart';
import '../controller/four_controller.dart';

class FoldersDialogController extends GetxController {
  var getObjectsController = Get.find<GetObjectsController>();
  var folderPageController = Get.put(FolderPageController());
  var lockPageController = Get.put(LockPageController());
  var downloadFileController = Get.find<DownloadFileController>();

  openFileDialog(FileCustomModel? fileUploadModel) {
    TextEditingController password = TextEditingController();
    var isUploading = false.obs;

    Get.defaultDialog(
      title: "Unlock",
      content: Obx(
        () => Column(
          children: [
            TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            isUploading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      isUploading(true);

                      if (fileUploadModel!.password == password.text) {
                        downloadFileController.getFileFromUrl(fileUploadModel);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Wrong Password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }

                      isUploading(false);
                      Get.back();
                    },
                    child: Text("Lock"),
                  ),
          ],
        ),
      ),
    );
  }

  lockUnlockFileDialog(FileCustomModel? fileUploadModel) {
    TextEditingController password = TextEditingController();
    var isUploading = false.obs;

    bool isLocking =
        fileUploadModel!.password == null || fileUploadModel.password == ""
            ? true
            : false;

    Get.defaultDialog(
      title: isLocking ? "Lock" : "Unlock",
      content: Obx(
        () => Column(
          children: [
            TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            isUploading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      isUploading(true);

                      if (isLocking) {
                        await lockPageController.lockFile(
                          fileUploadModel.copyWith(
                            password: password.text,
                          ),
                        );
                      } else if (fileUploadModel.password == password.text) {
                        await lockPageController.lockFile(
                          fileUploadModel.copyWith(
                            password: "",
                          ),
                        );
                      } else {
                        Fluttertoast.showToast(
                            msg: "Wrong Password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }

                      await getObjectsController.getFiles();
                      await getObjectsController.getFileSearchList();
                      await folderPageController.getFileSearchList();
                      isUploading(false);
                      Get.back();
                    },
                    child: Text(isLocking ? "Lock" : "Unlock"),
                  ),
          ],
        ),
      ),
    );
  }

  sendToFolder(FileCustomModel? fileUploadModel) {
    var isUploading = false.obs;

    Get.defaultDialog(
        title: "Folder",
        content: Obx(
          () => Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                isUploading.value
                    ? CircularProgressIndicator()
                    : SizedBox(
                        height: size.height * 0.5,
                        width: size.width * 0.9,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            var folderUploadModel =
                                getObjectsController.folderList[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    isUploading(true);
                                    await lockPageController.changefolder(
                                        fileUploadModel, folderUploadModel);
                                    await getObjectsController.getFiles();
                                    await getObjectsController.getFolders();
                                    await getObjectsController
                                        .getFolderSearchList();
                                    await folderPageController
                                        .getFileSearchList();
                                    Get.back();
                                    isUploading(false);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    width: size.width * 0.6,
                                    height: size.height * 0.05,
                                    child: Row(
                                      children: [
                                        CommonImageView(
                                          imagePath:
                                              ImageConstant.img008folder1,
                                          height: getSize(
                                            38.00,
                                          ),
                                          width: getSize(
                                            38.00,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                            folderUploadModel.folderName ?? ""),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: getObjectsController.folderList.length,
                        ),
                      ),
              ],
            ),
          ),
        ));
  }

  renameFolderDialog(FolderCustomModel? folderUploadModel) {
    TextEditingController folderName =
        TextEditingController(text: folderUploadModel!.folderName);
    var isUploading = false.obs;
    Get.defaultDialog(
      title: "Rename",
      content: Obx(
        () => Column(
          children: [
            TextField(
              controller: folderName,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            isUploading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      isUploading(true);
                      await lockPageController.renameFolder(
                        folderUploadModel.copyWith(
                          folderName: folderName.text,
                        ),
                      );
                      await getObjectsController.getFolders();
                      await getObjectsController.getFolderSearchList();
                      await folderPageController.getFileSearchList();
                      isUploading(false);
                      Get.back();
                    },
                    child: Text("Rename"),
                  ),
          ],
        ),
      ),
    );
  }

  renameFileDialog(FileCustomModel? fileUploadModel) {
    TextEditingController fileName =
        TextEditingController(text: fileUploadModel!.fileName);
    var isUploading = false.obs;
    Get.defaultDialog(
      title: "Rename",
      content: Obx(
        () => Column(
          children: [
            TextField(
              controller: fileName,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            isUploading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      isUploading(true);
                      await lockPageController.renameFile(
                        fileUploadModel.copyWith(
                          fileName: fileName.text,
                        ),
                      );
                      await getObjectsController.getFiles();
                      getObjectsController.getFileSearchList();

                      isUploading(false);
                      Get.back();
                    },
                    child: Text("Rename"),
                  ),
          ],
        ),
      ),
    );
  }

  createFolderDialog() {
    TextEditingController folderName = TextEditingController();
    var isUploading = false.obs;
    Get.defaultDialog(
      title: "Add Folder",
      content: Obx(
        () => Column(
          children: [
            TextField(
              controller: folderName,
              decoration: InputDecoration(
                hintText: 'Folder Name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            isUploading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      isUploading(true);
                      update();
                      await lockPageController.createFolder(
                        FolderCustomModel(
                          folderName: folderName.text,
                        ),
                      );
                      await getObjectsController.getFolders();
                      Get.back();
                    },
                    child: Text("Add"),
                  ),
          ],
        ),
      ),
    );
  }
}
