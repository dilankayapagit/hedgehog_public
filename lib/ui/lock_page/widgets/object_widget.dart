// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/model/folder_custom_model.dart';
import 'package:share_plus/share_plus.dart';

import '../../../model/file_custom_model.dart';
import '../../../services/download_file_controller.dart';
import '../../../services/get_objects_controller.dart';
import '../../folder_page/controller/twenty_controller.dart';
import '../controller/four_controller.dart';
import '../dialogs/folders_dialog_controllers.dart';

// ignore: must_be_immutable
class ObjectWidget extends StatelessWidget {
  ObjectWidget({
    Key? key,
    this.fileCustomModel,
    this.folderCustomModel,
  }) : super(key: key);

  var getObjectsController = Get.find<GetObjectsController>();
  var downloadFileController = Get.find<DownloadFileController>();
  var folderPageController = Get.find<FolderPageController>();
  var lockPageController = Get.find<LockPageController>();
  var foldersDialogController = Get.find<FoldersDialogController>();

  final FileCustomModel? fileCustomModel;
  final FolderCustomModel? folderCustomModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (fileCustomModel != null) {
          if (fileCustomModel!.password == null ||
              fileCustomModel!.password == "") {
            downloadFileController
                .getFileFromUrl(fileCustomModel ?? FileCustomModel());
            return;
          }

          foldersDialogController
              .openFileDialog(fileCustomModel ?? FileCustomModel());
        } else {
          folderPageController
              .setFolder(folderCustomModel ?? FolderCustomModel());
          Get.toNamed(
            AppRoutes.twentyScreen,
          );
        }
      },
      child: Container(
        decoration: AppDecoration.fillGray50.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder24,
        ),
        height: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: getPadding(
                  left: 16,
                  //right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (folderCustomModel != null)
                      Padding(
                        padding: getPadding(
                          top: 3,
                        ),
                        child: CommonImageView(
                          imagePath: ImageConstant.img008folder1,
                          height: getSize(
                            38.00,
                          ),
                          width: getSize(
                            38.00,
                          ),
                        ),
                      ),
                    if (fileCustomModel != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                        ),
                        child: CommonImageView(
                          imagePath: Constants.getImg(fileCustomModel),
                          height: getVerticalSize(
                            38.00,
                          ),
                          width: getHorizontalSize(
                            32.00,
                          ),
                        ),
                      ),
                    if (folderCustomModel != null)
                      PopupMenuButton<int>(
                        itemBuilder: (context) => [
                          PopupMenuItem<int>(value: 0, child: Text("Delete")),
                          PopupMenuItem<int>(value: 1, child: Text("Rename")),
                        ],
                        onSelected: (item) => selectedFolderItem(context, item),
                      ),
                    if (fileCustomModel != null)
                      PopupMenuButton<int>(
                        itemBuilder: (context) => [
                          PopupMenuItem<int>(value: 0, child: Text("Delete")),
                          PopupMenuItem<int>(value: 1, child: Text("Share")),
                          PopupMenuItem<int>(
                              value: 2,
                              child: fileCustomModel!.isPinned ?? false
                                  ? Text("Unpin")
                                  : Text("Pin")),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Text("CID"),
                          ),
                          PopupMenuItem<int>(value: 4, child: Text("Rename")),
                          PopupMenuItem<int>(value: 5, child: Text("Move")),
                          PopupMenuItem<int>(
                              value: 6,
                              child: fileCustomModel!.password == null ||
                                      fileCustomModel!.password == ""
                                  ? Text("Lock")
                                  : Text("Unlock")),
                        ],
                        onSelected: (item) => selectedFileItem(context, item),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 16,
                right: 16,
              ),
              child: Text(
                folderCustomModel != null
                    ? folderCustomModel!.folderName ?? ""
                    : fileCustomModel!.fileName ?? "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtUrbanistSemiBold16Gray900.copyWith(
                  letterSpacing: 0.20,
                  height: 1.25,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 16,
                top: 1,
                right: 16,
                bottom: 12,
              ),
              child: Text(
                "created ${folderCustomModel != null ? folderCustomModel!.createdAt.toString().split(" ")[0] : fileCustomModel!.createdAt.toString().split(" ")[0]}"
                    .tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtUrbanistRomanRegular12.copyWith(
                  letterSpacing: 0.20,
                  height: 1.25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectedFolderItem(BuildContext context, item) async {
    switch (item) {
      case 0:
        await getObjectsController
            .deleteFolderWithFiles(folderCustomModel!.folderId ?? "");
        // await getObjectsController
        //     .deleteFolder(folderUploadModel!.folderId ?? "");
        await getObjectsController.getFolders();
        break;
      case 1:
        foldersDialogController.renameFolderDialog(folderCustomModel);
        break;
    }
  }

  void selectedFileItem(BuildContext context, item) async {
    switch (item) {
      case 0:
        await getObjectsController.deleteFile(fileCustomModel!.fileId ?? "");
        await getObjectsController.setDeleteAvailableSize(
            int.parse(fileCustomModel!.fileSize ?? "0"));
        await getObjectsController.getFiles();
        break;
      case 1:
        Share.share(
            'check out ${fileCustomModel!.fileName} ${fileCustomModel!.fileUrl}',
            subject: 'Ipfs link to ${fileCustomModel!.fileName}');
        break;
      case 2:
        if (fileCustomModel!.isPinned ?? false) {
          await getObjectsController.makePinned(
              fileCustomModel!.fileId ?? "", false);
          await getObjectsController.getFiles();
        } else {
          await getObjectsController.makePinned(
              fileCustomModel!.fileId ?? "", true);
          await getObjectsController.getFiles();
        }
        break;
      case 3:
        await Clipboard.setData(
            ClipboardData(text: fileCustomModel!.cId ?? ""));
        Fluttertoast.showToast(
          msg: "Copied to Clipbord! ${fileCustomModel!.cId}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        break;
      case 4:
        foldersDialogController.renameFileDialog(fileCustomModel);
        break;
      case 5:
        foldersDialogController.sendToFolder(fileCustomModel);
        break;
      case 6:
        foldersDialogController.lockUnlockFileDialog(fileCustomModel);
        break;
    }
  }
}
