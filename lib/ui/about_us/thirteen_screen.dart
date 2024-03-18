import '../../widgets/custom_forward.dart';
import '../../widgets/website_page.dart';
import 'controller/thirteen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_image.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_title.dart';
import 'package:hedgehog_lock/widgets/app_bar/custom_app_bar.dart';

class ThirteenScreen extends GetWidget<ThirteenController> {
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
              margin: getMargin(left: 24, top: 14, bottom: 13),
              onTap: onTapArrowleft5),
          title: AppbarTitle(
              text: "lbl_about_us".tr, margin: getMargin(left: 16))),
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: getPadding(
              left: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                        Container(
                          margin: getMargin(left: 24, top: 24, bottom: 24),
                          child: Icon(
                            Icons.policy,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomFroward(
                          onTap: () {
                            Get.to(() => WebsitePage(
                                  url:
                                      'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
                                ));
                          },
                          width: 320,
                          focusNode: FocusNode(),
                          icon: Container(
                            child: CommonImageView(
                              svgPath: ImageConstant.imgArrowdown,
                            ),
                          ),
                          hintText: "Terms of Use (EULA)".tr,
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
                      top: 19,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: getMargin(left: 24, top: 24, bottom: 24),
                          child: Icon(
                            Icons.privacy_tip,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomFroward(
                          onTap: () {
                            Get.to(() => WebsitePage(
                                  url:
                                      'https://sites.google.com/view/privacy-policy--hedgehog/home',
                                ));
                          },
                          width: 320,
                          focusNode: FocusNode(),
                          icon: Container(
                            child: CommonImageView(
                              svgPath: ImageConstant.imgArrowdown,
                            ),
                          ),
                          hintText: "msg_2_privacy_policy".tr,
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
                      top: 19,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          margin: getMargin(left: 24, top: 24, bottom: 24),
                          child: Icon(
                            Icons.store,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomFroward(
                          onTap: () {
                            Get.to(() => WebsitePage(
                                  url:
                                      'https://sites.google.com/view/hedgehog-our-story/home',
                                ));
                          },
                          width: 320,
                          focusNode: FocusNode(),
                          icon: Container(
                            child: CommonImageView(
                              svgPath: ImageConstant.imgArrowdown,
                            ),
                          ),
                          hintText: "Our Story".tr,
                          margin: getMargin(
                            top: 1,
                            bottom: 1,
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
    );
  }

  onTapArrowleft5() {
    Get.back();
  }
}
