import '../../model/file_custom_model.dart';
import '../../services/auth_controller.dart';
import '../../services/get_objects_controller.dart';
import '../lock_page/widgets/object_widget.dart';
import 'controller/home_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_image.dart';
import 'package:hedgehog_lock/widgets/app_bar/custom_app_bar.dart';
import 'package:hedgehog_lock/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class HomeMenuPage extends StatefulWidget {
  @override
  State<HomeMenuPage> createState() => _HomeMenuPageState();
}

class _HomeMenuPageState extends State<HomeMenuPage> {
  var getObjectsController = Get.find<GetObjectsController>();
  var controller = Get.find<HomeMenuController>();
  var authController = Get.find<AuthController>();
  @override
  void initState() {
    super.initState();
    authController.getUserDetails();
    controller.reciveFiles();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          height: getVerticalSize(
            59.00,
          ),
          leadingWidth: 70,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 8),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          24.00,
                        ),
                      ),
                      child: controller.getUrlPhoto() != ""
                          ? Image.network(
                              controller.getUrlPhoto(),
                              height: getSize(
                                48.00,
                              ),
                              width: getSize(
                                48.00,
                              ),
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    getHorizontalSize(
                                      24.00,
                                    ),
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  ),
                                );
                              },
                            )
                          : CommonImageView(
                              imagePath: ImageConstant.imgEllipse120x120,
                              height: getSize(
                                48.00,
                              ),
                              width: getSize(
                                48.00,
                              ),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          centerTitle: false,
          title: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: AppbarImage(
                        height: getSize(
                          21.00,
                        ),
                        width: getSize(
                          21.00,
                        ),
                        imagePath:
                            authController.userCustomModel.value.payPackage !=
                                    null
                                ? authController
                                    .userCustomModel.value.payPackage.img
                                : ImageConstant.iconFree,
                        margin: getMargin(
                          top: 15,
                          bottom: 2,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(
                          left: 7,
                          top: 12,
                        ),
                        child: Text(
                          controller.greeting(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtUrbanistRomanMedium16.copyWith(
                            letterSpacing: 0.20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 25,
                      //top: 0,
                      //right: 24,
                    ),
                    child: Text(
                      controller.getName(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtUrbanistRomanBold20Indigo903,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Obx(
          () => SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: getPadding(
                  left: 24,
                  top: 23,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // if (authController.userCustomModel.value.payPackageId ==
                    //     Constants.payPackageModelList[3].payId)
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.seventeenScreen);
                      },
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        margin: getMargin(
                          right: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.circleBorder24,
                        ),
                        child: Container(
                          height: getVerticalSize(
                            190.00,
                          ),
                          width: getHorizontalSize(
                            380.00,
                          ),
                          decoration:
                              AppDecoration.gradientIndigo901Indigo902.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder24,
                          ),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  ImageConstant.img2952,
                                  opacity: const AlwaysStoppedAnimation(.5),
                                  height: getVerticalSize(
                                    147.00,
                                  ),
                                  width: getHorizontalSize(
                                    262.00,
                                  ),
                                ),
                              ),
                              if (authController
                                      .userCustomModel.value.payPackage !=
                                  null)
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: AppbarImage(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.seventeenScreen);
                                    },
                                    height: getSize(150),
                                    width: getSize(150),
                                    imagePath: authController.userCustomModel
                                            .value.payPackage.img ??
                                        ImageConstant.iconBasic,
                                    margin: getMargin(
                                      top: 10,
                                      bottom: 2,
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: getPadding(
                                    left: 16,
                                    top: 27,
                                    right: 16,
                                    bottom: 27,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                          right: 10,
                                        ),
                                        child: Text(
                                          "lbl_membership".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtUrbanistRomanBold32,
                                        ),
                                      ),
                                      if (authController.userCustomModel.value
                                              .payPackage !=
                                          null)
                                        Padding(
                                          padding: getPadding(
                                            top: 40,
                                          ),
                                          child: Container(
                                            width: 200,
                                            child: Text(
                                              "You got ${authController.userCustomModel.value.payPackage.payName ?? ""} membership.",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              maxLines: 2,
                                              style: AppStyle
                                                  .txtUrbanistRomanMedium12
                                                  .copyWith(
                                                fontSize: 14,
                                                letterSpacing: 0.20,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 23,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "lbl_your_shortcuts".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtUrbanistRomanBold20,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.imgUpload();
                      },
                      child: Padding(
                        padding: getPadding(
                          left: 8,
                          top: 24,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomIconButton(
                                  height: 60,
                                  width: 60,
                                  alignment: Alignment.centerLeft,
                                  child: CommonImageView(
                                    svgPath: ImageConstant.imgUser,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 6,
                                    top: 15,
                                    right: 6,
                                  ),
                                  child: Text(
                                    "lbl_image".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtUrbanistRomanSemiBold16
                                        .copyWith(
                                      letterSpacing: 0.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.cameraUpload();
                              },
                              child: Padding(
                                padding: getPadding(
                                  left: 41,
                                  bottom: 2,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomIconButton(
                                      height: 60,
                                      width: 60,
                                      child: CommonImageView(
                                        svgPath: ImageConstant.imgCamera,
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: getPadding(
                                          left: 1,
                                          top: 13,
                                          right: 1,
                                        ),
                                        child: Text(
                                          "lbl_camera".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtUrbanistRomanSemiBold16
                                              .copyWith(
                                            letterSpacing: 0.20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.videoUpload();
                              },
                              child: Padding(
                                padding: getPadding(
                                  left: 41,
                                  bottom: 2,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomIconButton(
                                      height: 60,
                                      width: 60,
                                      alignment: Alignment.centerLeft,
                                      child: CommonImageView(
                                        svgPath: ImageConstant.imgPlay,
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 8,
                                        top: 13,
                                        right: 8,
                                      ),
                                      child: Text(
                                        "lbl_video".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtUrbanistRomanSemiBold16
                                            .copyWith(
                                          letterSpacing: 0.20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.fileUpload();
                              },
                              child: Padding(
                                padding: getPadding(
                                  left: 41,
                                  bottom: 2,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomIconButton(
                                      height: 60,
                                      width: 60,
                                      //alignment: Alignment.centerLeft,
                                      child: CommonImageView(
                                        svgPath: ImageConstant.imgMenu60x60,
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 14,
                                        top: 13,
                                        right: 14,
                                      ),
                                      child: Text(
                                        "lbl_files".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtUrbanistRomanSemiBold16
                                            .copyWith(
                                          letterSpacing: 0.20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 22,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "lbl_pinned_files".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtUrbanistRomanBold20,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 24,
                        right: 10,
                      ),
                      child: Obx(
                        () => GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                          itemCount: getObjectsController.pinFileList.length,
                          itemBuilder: (context, index) {
                            FileCustomModel model =
                                getObjectsController.pinFileList[index];
                            if (model.isPinned ?? false) {
                              return ObjectWidget(
                                fileCustomModel: model,
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
