import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hedgehog_lock/model/folder_custom_model.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/ui/lock_page/dialogs/folders_dialog_controllers.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../model/file_custom_model.dart';
import '../../services/get_objects_controller.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../home_menu_page/controller/home_menu_controller.dart';
import 'widgets/object_widget.dart';
import 'controller/four_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class FourPage extends StatefulWidget {
  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage>
    with SingleTickerProviderStateMixin {
  var getObjectsController = Get.find<GetObjectsController>();
  var homeMenuController = Get.find<HomeMenuController>();
  var controller = Get.find<LockPageController>();
  var folderPageController = Get.find<FoldersDialogController>();

  TextEditingController searchControllerFolder = TextEditingController();
  TextEditingController searchControllerFile = TextEditingController();

  var selectedPage = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(initialIndex: selectedPage, vsync: this, length: 2);

    _tabController.addListener(() {
      log(_tabController.animation!.value.toString());
      // if (_tabController.indexIsChanging) {
      //   log("_tabController.index.toString()");
      // }
    });
    getObjectsController.getFileSearchList();
    getObjectsController.getFolderSearchList();
  }

  @override
  void dispose() {
    searchControllerFolder.dispose();
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: getVerticalSize(
          56.00,
        ),
        centerTitle: true,
        leadingWidth: 116,
        leading: AppbarImage(
          height: getSize(
            32.00,
          ),
          width: getSize(
            40.00,
          ),
          //imagePath: ImageConstant.imgMain,
          margin: getMargin(
            right: 84,
            bottom: 4,
          ),
        ),
        title: AppbarTitle(
          text: "lbl_lock".tr,
        ),
      ),
      floatingActionButton: selectedPage == 0
          ? FloatingActionButton.extended(
              onPressed: () {
                final user = FirebaseAuth.instance.currentUser;

                if (user!.isAnonymous) {
                  Fluttertoast.showToast(
                      msg: "Please Sign In",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  return;
                }

                folderPageController.createFolderDialog();
              },
              label: Text("Add Folder"),
              icon: Icon(Icons.folder),
            )
          : FloatingActionButton.extended(
              onPressed: () {
                final user = FirebaseAuth.instance.currentUser;

                if (user!.isAnonymous) {
                  Fluttertoast.showToast(
                      msg: "Please Sign In",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  return;
                }
                homeMenuController.fileUpload();
              },
              label: Text("Upload File"),
              icon: Icon(Icons.file_upload),
            ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              ToggleSwitch(
                minWidth: 90.0,
                initialLabelIndex: selectedPage,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,
                labels: ['Folders', 'Files'],
                activeBgColors: [
                  [Colors.blue],
                  [Colors.blue]
                ],
                onToggle: (index) {
                  selectedPage = index!;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) {
                  getObjectsController.setSearchFolder(val);
                  getObjectsController.setSearchFile(val);
                },
                controller: searchControllerFolder,
                decoration: Constants.buildDecoration(),
              ),
              SizedBox(
                height: 20,
              ),
              if (selectedPage == 0)
                Obx(
                  () => GridView.builder(
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
                    itemCount: getObjectsController.searchFolderList.length,
                    itemBuilder: (context, index) {
                      FolderCustomModel model =
                          getObjectsController.searchFolderList[index];
                      return ObjectWidget(
                        folderCustomModel: model,
                      );
                    },
                  ),
                ),
              if (selectedPage == 1)
                Obx(
                  () => GridView.builder(
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
                    itemCount: getObjectsController.searchFileList.length,
                    itemBuilder: (context, index) {
                      FileCustomModel model =
                          getObjectsController.searchFileList[index];

                      return ObjectWidget(
                        fileCustomModel: model,
                      );
                    },
                  ),
                ),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
