import 'dart:developer';

import 'package:hedgehog_lock/model/file_custom_model.dart';

import '../../services/get_objects_controller.dart';
import '../home_menu_page/controller/home_menu_controller.dart';
import '../lock_page/widgets/object_widget.dart';
import 'controller/twenty_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_title.dart';
import 'package:hedgehog_lock/widgets/app_bar/custom_app_bar.dart';

class TwentyScreen extends StatefulWidget {
  @override
  State<TwentyScreen> createState() => _TwentyScreenState();
}

class _TwentyScreenState extends State<TwentyScreen> {
  TextEditingController searchController = TextEditingController();
  var controller = Get.find<FolderPageController>();
  var getObjectsController = Get.find<GetObjectsController>();
  var homeMenuController = Get.find<HomeMenuController>();

  @override
  void initState() {
    super.initState();
    controller.getFileSearchList();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  fun() {
    Get.defaultDialog(
      title: "Delete Folder",
      content: Text("Do you want to delete this Folder?"),
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Cancel"),
      ),
      confirm: TextButton(
        onPressed: () async {
          Get.back();
          await getObjectsController
              .deleteFolderWithFiles(controller.folder.value.folderId ?? "");
          // await getObjectsController
          //     .deleteFolder(controller.folder.value.folderId ?? "");
          await getObjectsController.getFolders();
          Get.back();
        },
        child: Text(
          "Delete",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
        height: getVerticalSize(
          56.00,
        ),
        leadingWidth: 50,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            log("xffff");
            Get.back();
          },
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              fun();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CommonImageView(
                svgPath: ImageConstant.imgTrash20x20,
                height: getVerticalSize(
                  32.00,
                ),
                width: getHorizontalSize(
                  32.00,
                ),
              ),
            ),
          ),
        ],
        // leadingWidth: 98,
        title: AppbarTitle(
          text: controller.folder.value.folderName ?? "",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(
          () => Container(
            width: size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: getPadding(
                  left: 24,
                  top: 20,
                  right: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      onChanged: (val) {
                        controller.setSearchFileVal(val);
                      },
                      controller: searchController,
                      decoration: Constants.buildDecoration(),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 25,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: getVerticalSize(
                            112.00,
                          ),
                          crossAxisCount: 2,
                          mainAxisSpacing: getHorizontalSize(
                            24.00,
                          ),
                          crossAxisSpacing: getHorizontalSize(
                            24.00,
                          ),
                        ),
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.searchFileList.length,
                        itemBuilder: (context, index) {
                          FileCustomModel model =
                              controller.searchFileList[index];
                          return ObjectWidget(
                            fileCustomModel: model,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await homeMenuController.fileUpload(
              parentId: controller.folder.value.folderId);
          controller.getFileSearchList();
        },
        label: Text("Upload File"),
        icon: Icon(Icons.file_upload),
      ),
    );
  }
}
