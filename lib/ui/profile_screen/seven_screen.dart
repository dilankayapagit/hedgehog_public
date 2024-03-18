import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hedgehog_lock/services/auth_controller.dart';
import 'package:hedgehog_lock/ui/delete_user_data/delete_user_data.dart';
import 'package:share_plus/share_plus.dart';

import '../../widgets/custom_forward.dart';
import 'controller/seven_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_image.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_title.dart';
import 'package:hedgehog_lock/widgets/app_bar/custom_app_bar.dart';

class SevenScreen extends StatefulWidget {
  @override
  State<SevenScreen> createState() => _SevenScreenState();
}

class _SevenScreenState extends State<SevenScreen> {
  SevenController controller = Get.put(SevenController());

  var authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    controller.getName();
    controller.getUrlPhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
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
          text: "lbl_profile".tr,
        ),
      ),
      body: Obx(
        () => Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(
                left: 24,
                top: 16,
                right: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: getVerticalSize(
                      200.00,
                    ),
                    width: getHorizontalSize(
                      350.00,
                    ),
                    margin: getMargin(
                      left: 15,
                      right: 15,
                    ),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: getPadding(
                              top: 5,
                              bottom: 10,
                            ),
                            child: CommonImageView(
                              imagePath: ImageConstant.imgGroup2,
                              height: getVerticalSize(
                                132.00,
                              ),
                              width: getHorizontalSize(
                                350.00,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 40,
                              right: 40,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: getSize(
                                      120.00,
                                    ),
                                    width: getSize(
                                      120.00,
                                    ),
                                    margin: getMargin(
                                      left: 3,
                                      right: 4,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                60.00,
                                              ),
                                            ),
                                            child: controller
                                                        .profilePic.value ==
                                                    ""
                                                ? controller.getUrlPhoto() != ""
                                                    ? Image.network(
                                                        controller
                                                            .getUrlPhoto(),
                                                        height: getSize(
                                                          120.00,
                                                        ),
                                                        width: getSize(
                                                          120.00,
                                                        ),
                                                        fit: BoxFit.cover,
                                                        loadingBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Widget child,
                                                                ImageChunkEvent?
                                                                    loadingProgress) {
                                                          if (loadingProgress ==
                                                              null)
                                                            return child;
                                                          return Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              value: loadingProgress
                                                                          .expectedTotalBytes !=
                                                                      null
                                                                  ? loadingProgress
                                                                          .cumulativeBytesLoaded /
                                                                      loadingProgress
                                                                          .expectedTotalBytes!
                                                                  : null,
                                                            ),
                                                          );
                                                        },
                                                      )
                                                    : CommonImageView(
                                                        imagePath: ImageConstant
                                                            .imgEllipse120x120,
                                                        height: getSize(
                                                          120.00,
                                                        ),
                                                        width: getSize(
                                                          120.00,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      )
                                                : Image.file(
                                                    File(
                                                      controller
                                                          .profilePic.value,
                                                    ),
                                                    height: getSize(
                                                      120.00,
                                                    ),
                                                    width: getSize(
                                                      120.00,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.changeProfilePic();
                                          },
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Padding(
                                              padding: getPadding(
                                                left: 10,
                                                top: 10,
                                              ),
                                              child: CommonImageView(
                                                svgPath: ImageConstant.imgEdit,
                                                height: getSize(
                                                  30.00,
                                                ),
                                                width: getSize(
                                                  30.00,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      controller.changeName();
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: getPadding(
                                          top: 15,
                                        ),
                                        child: Text(
                                          controller.name.value,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtUrbanistSemiBold14Gray900
                                              .copyWith(
                                            fontSize: 24,
                                            letterSpacing: 0.20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (authController
                                        .userCustomModel.value.payPackage !=
                                    null)
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      authController.userCustomModel.value
                                          .payPackage.payName,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtUrbanistSemiBold14Gray900
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: getVerticalSize(
                        1.00,
                      ),
                      width: getHorizontalSize(
                        380.00,
                      ),
                      margin: getMargin(
                        top: 21,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.gray200,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        top: 19,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CommonImageView(
                            svgPath: ImageConstant.imgIconlylightme,
                            height: getSize(
                              24.00,
                            ),
                            width: getSize(
                              24.00,
                            ),
                          ),
                          CustomFroward(
                            onTap: () {
                              Get.toNamed(AppRoutes.eightScreen);
                            },
                            width: 340,
                            focusNode: FocusNode(),
                            icon: Container(
                              margin: getMargin(
                                left: 274,
                              ),
                              child: CommonImageView(
                                svgPath: ImageConstant.imgArrowdown,
                              ),
                            ),
                            hintText: "lbl_chnage_pw".tr,
                            margin: getMargin(
                              top: 1,
                              bottom: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        top: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: getPadding(
                              bottom: 1,
                            ),
                            child: CommonImageView(
                              svgPath: ImageConstant.imgClock24x24,
                              height: getSize(
                                24.00,
                              ),
                              width: getSize(
                                24.00,
                              ),
                            ),
                          ),
                          CustomFroward(
                            onTap: () {
                              Get.toNamed(AppRoutes.seventeenScreen);
                            },
                            width: 340,
                            focusNode: FocusNode(),
                            icon: Container(
                              margin: getMargin(
                                left: 246,
                              ),
                              child: CommonImageView(
                                svgPath: ImageConstant.imgArrowdown,
                              ),
                            ),
                            hintText: "lbl_membership".tr,
                            margin: getMargin(
                              top: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        top: 23,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: getPadding(
                              bottom: 1,
                            ),
                            child: CommonImageView(
                              svgPath: ImageConstant.imgFile24x24,
                              height: getSize(
                                24.00,
                              ),
                              width: getSize(
                                24.00,
                              ),
                            ),
                          ),
                          CustomFroward(
                            onTap: () {
                              Get.toNamed(AppRoutes.elevenScreen);
                            },
                            width: 340,
                            focusNode: FocusNode(),
                            icon: Container(
                              margin: getMargin(
                                left: 253,
                              ),
                              child: CommonImageView(
                                svgPath: ImageConstant.imgArrowdown,
                              ),
                            ),
                            hintText: "lbl_storage".tr,
                            margin: getMargin(
                              top: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        top: 19,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CommonImageView(
                            svgPath: ImageConstant.imgUser24x24,
                            color: Colors.black,
                            height: getSize(
                              24.00,
                            ),
                            width: getSize(
                              24.00,
                            ),
                          ),
                          CustomFroward(
                            onTap: () {
                              Get.to(() => DeleteUserData());
                            },
                            width: 340,
                            focusNode: FocusNode(),
                            icon: Container(
                              margin: getMargin(
                                left: 274,
                              ),
                              child: CommonImageView(
                                svgPath: ImageConstant.imgArrowdown,
                              ),
                            ),
                            hintText: "Delete Account".tr,
                            margin: getMargin(
                              top: 1,
                              bottom: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: getVerticalSize(
                        1.00,
                      ),
                      width: getHorizontalSize(
                        380.00,
                      ),
                      margin: getMargin(
                        top: 23,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.gray200,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        top: 23,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CommonImageView(
                            svgPath: ImageConstant.imgUser1,
                            height: getSize(
                              24.00,
                            ),
                            width: getSize(
                              24.00,
                            ),
                          ),
                          CustomFroward(
                            onTap: () {
                              // Get.toNamed(AppRoutes.twelvePage);
                              Share.share(
                                  'check out http://www.hedgehoglock.com',
                                  subject: 'http://www.hedgehoglock.com');
                            },
                            width: 340,
                            focusNode: FocusNode(),
                            icon: Container(
                              margin: getMargin(
                                left: 233,
                              ),
                              child: CommonImageView(
                                svgPath: ImageConstant.imgArrowdown,
                              ),
                            ),
                            hintText: "lbl_recomend".tr,
                            margin: getMargin(
                              top: 1,
                              bottom: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        top: 25,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: getPadding(
                              bottom: 1,
                            ),
                            child: CommonImageView(
                              svgPath: ImageConstant.imgMusic,
                              height: getSize(
                                24.00,
                              ),
                              width: getSize(
                                24.00,
                              ),
                            ),
                          ),
                          CustomFroward(
                            width: 340,
                            onTap: () {
                              Get.toNamed(AppRoutes.fourteenScreen);
                            },
                            focusNode: FocusNode(),
                            icon: Container(
                              margin: getMargin(
                                left: 224,
                              ),
                              child: CommonImageView(
                                svgPath: ImageConstant.imgArrowdown,
                              ),
                            ),
                            hintText: "lbl_community".tr,
                            margin: getMargin(
                              top: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        top: 23,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CommonImageView(
                            svgPath: ImageConstant.imgInfo,
                            height: getSize(
                              24.00,
                            ),
                            width: getSize(
                              24.00,
                            ),
                          ),
                          CustomFroward(
                            width: 340,
                            onTap: () {
                              Get.toNamed(AppRoutes.thirteenScreen);
                            },
                            focusNode: FocusNode(),
                            icon: Container(
                              margin: getMargin(
                                left: 244,
                              ),
                              child: CommonImageView(
                                svgPath: ImageConstant.imgArrowdown,
                              ),
                            ),
                            hintText: "lbl_about_us".tr,
                            margin: getMargin(
                              top: 1,
                              bottom: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: getVerticalSize(
                        1.00,
                      ),
                      width: getHorizontalSize(
                        380.00,
                      ),
                      margin: getMargin(
                        top: 24,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.gray200,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      FirebaseAuth.instance.signOut();
                      Get.offAllNamed(AppRoutes.signInPageScreen);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(
                          top: 23,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: getPadding(
                                bottom: 1,
                              ),
                              child: CommonImageView(
                                svgPath: ImageConstant.imgRefresh24x24,
                                height: getSize(
                                  24.00,
                                ),
                                width: getSize(
                                  24.00,
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 16,
                                top: 3,
                              ),
                              child: Text(
                                "lbl_logout2".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtUrbanistSemiBold18RedA200
                                    .copyWith(
                                  letterSpacing: 0.20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
