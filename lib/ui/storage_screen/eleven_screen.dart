import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../services/auth_controller.dart';
import 'controller/eleven_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_image.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_title.dart';
import 'package:hedgehog_lock/widgets/app_bar/custom_app_bar.dart';
import 'package:hedgehog_lock/widgets/custom_button.dart';

class ElevenScreen extends StatefulWidget {
  @override
  State<ElevenScreen> createState() => _ElevenScreenState();
}

class _ElevenScreenState extends State<ElevenScreen> {
  var controller = Get.put(ElevenController());
  var authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    authController.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
          height: getVerticalSize(56.00),
          leadingWidth: 52,
          leading: AppbarImage(
              height: getSize(28.00),
              width: getSize(28.00),
              svgPath: ImageConstant.imgArrowleft,
              margin: getMargin(left: 24, top: 12, bottom: 15),
              onTap: onTapArrowleft3),
          title:
              AppbarTitle(text: "lbl_storage".tr, margin: getMargin(left: 16))),
      body: Obx(
        () => Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: getMargin(left: 24, top: 16, right: 24),
              color: ColorConstant.indigoA100,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder35),
              child: Container(
                height: getVerticalSize(177.00),
                width: getHorizontalSize(380.00),
                decoration: AppDecoration.fillIndigoA100
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder35),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: getVerticalSize(144.00),
                        width: getHorizontalSize(350.00),
                        margin:
                            getMargin(left: 8, top: 9, right: 10, bottom: 10),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: CommonImageView(
                                    imagePath: ImageConstant.imgGroup2144x350,
                                    height: getVerticalSize(144.00),
                                    width: getHorizontalSize(350.00))),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: getHorizontalSize(157.00),
                        margin:
                            getMargin(left: 24, top: 20, right: 24, bottom: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: getHorizontalSize(115.00),
                                margin: getMargin(right: 10),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "lbl_current".tr,
                                          style: TextStyle(
                                              color: ColorConstant.black901,
                                              fontSize: getFontSize(17),
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: " ",
                                          style: TextStyle(
                                              color: ColorConstant.black901,
                                              fontSize: getFontSize(25),
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: "lbl_storage".tr,
                                          style: TextStyle(
                                              color: ColorConstant.black901,
                                              fontSize: getFontSize(32),
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w600))
                                    ]),
                                    textAlign: TextAlign.left)),
                            Container(
                                margin: getMargin(top: 5, right: 10),
                                child: RichText(
                                    text: TextSpan(children: [
                                      if (authController.userCustomModel.value
                                              .storageUsedBytes !=
                                          null)
                                        TextSpan(
                                            text:
                                                "${((authController.userCustomModel.value.storageUsedBytes)! / (1000 * 1000 * 1000)).toStringAsFixed(1)} ",
                                            style: TextStyle(
                                                color: ColorConstant.indigo903,
                                                fontSize: getFontSize(12),
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: "lbl".tr,
                                          style: TextStyle(
                                              color: ColorConstant.black901,
                                              fontSize: getFontSize(12),
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w600)),
                                      if (authController.userCustomModel.value
                                              .payPackage !=
                                          null)
                                        TextSpan(
                                            text:
                                                "${((authController.userCustomModel.value.payPackage.storageBytes) / (1000 * 1000 * 1000)).toStringAsFixed(0)} ",
                                            style: TextStyle(
                                                color: ColorConstant.black901,
                                                fontSize: getFontSize(12),
                                                fontFamily: 'Urbanist',
                                                fontWeight: FontWeight.w600)),
                                      TextSpan(
                                          text: "lbl_gb".tr,
                                          style: TextStyle(
                                              color: ColorConstant.black901,
                                              fontSize: getFontSize(12),
                                              fontFamily: 'Urbanist',
                                              fontWeight: FontWeight.w600))
                                    ]),
                                    textAlign: TextAlign.left)),
                            CustomButton(
                                onTap: () {
                                  Get.toNamed(AppRoutes.seventeenScreen);
                                },
                                width: 157,
                                text: "Upgrade Now",
                                margin: getMargin(top: 10),
                                variant: ButtonVariant.FillRed500,
                                shape: ButtonShape.RoundedBorder13,
                                padding: ButtonPadding.PaddingAll10,
                                fontStyle: ButtonFontStyle.UrbanistSemiBold12)
                          ],
                        ),
                      ),
                    ),
                    if (authController.userCustomModel.value.storageUsedBytes !=
                            null &&
                        authController.userCustomModel.value.storageUsedBytes !=
                            null)
                      Padding(
                          padding: getPadding(
                              left: 15, top: 25, right: 15, bottom: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SleekCircularSlider(
                              initialValue: (authController.userCustomModel
                                      .value.storageUsedBytes)! /
                                  (1000 * 1000 * 1000),
                              min: 0,
                              max: (authController.userCustomModel.value
                                      .payPackage.storageBytes) /
                                  (1000 * 1000 * 1000),
                              isConstValue: true,
                              appearance: CircularSliderAppearance(),
                              innerWidget: (double) {
                                return Center(
                                  child: Text(
                                    "${((((authController.userCustomModel.value.storageUsedBytes)! / (1000 * 1000 * 1000)) / ((authController.userCustomModel.value.payPackage.storageBytes) / (1000 * 1000 * 1000))) * 100).toStringAsFixed(1)}%",
                                  ),
                                );
                              },
                            ),
                          )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft3() {
    Get.back();
  }
}
