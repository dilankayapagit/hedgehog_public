import '../../widgets/custom_forward.dart';
import '../../widgets/website_page.dart';
import 'controller/fourteen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_image.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_title.dart';
import 'package:hedgehog_lock/widgets/app_bar/custom_app_bar.dart';

class FourteenScreen extends GetWidget<FourteenController> {
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
              onTap: () {
                Get.back();
              }),
          title: AppbarTitle(
              text: "lbl_community".tr, margin: getMargin(left: 16))),
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
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(
                //     padding: getPadding(
                //       top: 19,
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisSize: MainAxisSize.max,
                //       children: [
                //         Container(
                //           margin: getMargin(left: 24, top: 24, bottom: 24),
                //           child: CommonImageView(
                //             svgPath: ImageConstant.imgFrame1,
                //             height: getSize(
                //               28.00,
                //             ),
                //             width: getSize(
                //               28.00,
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           width: 20,
                //         ),
                //         CustomFroward(
                //           onTap: () {
                //             Get.to(() => WebsitePage(
                //                   url: 'http://www.hedgehoglock.com',
                //                 ));
                //           },
                //           width: 320,
                //           focusNode: FocusNode(),
                //           icon: Container(
                //             child: CommonImageView(
                //               svgPath: ImageConstant.imgArrowdown,
                //             ),
                //           ),
                //           hintText: "lbl_website".tr,
                //           margin: getMargin(
                //             top: 1,
                //             bottom: 1,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
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
                          child: CommonImageView(
                            svgPath: ImageConstant.imgTwitter,
                            height: getSize(
                              28.00,
                            ),
                            width: getSize(
                              28.00,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomFroward(
                          onTap: () {
                            Get.to(() => WebsitePage(
                                  url:
                                      'https://twitter.com/hedgehog_lock?s=21&t=sracPMH0v5JFkcvFHA0RJw',
                                ));
                          },
                          width: 320,
                          focusNode: FocusNode(),
                          icon: Container(
                            child: CommonImageView(
                              svgPath: ImageConstant.imgArrowdown,
                            ),
                          ),
                          hintText: "lbl_twitter".tr,
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
                          child: CommonImageView(
                            svgPath: ImageConstant.imgInstagram,
                            height: getSize(
                              28.00,
                            ),
                            width: getSize(
                              28.00,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomFroward(
                          onTap: () {
                            Get.to(() => WebsitePage(
                                  url:
                                      'https://www.instagram.com/hedgehog_lock_com/?igshid=YWJhMjlhZTc',
                                ));
                          },
                          width: 320,
                          focusNode: FocusNode(),
                          icon: Container(
                            child: CommonImageView(
                              svgPath: ImageConstant.imgArrowdown,
                            ),
                          ),
                          hintText: "lbl_instagram".tr,
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
}
