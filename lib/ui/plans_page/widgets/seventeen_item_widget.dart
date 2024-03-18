import 'dart:io';

import 'package:hedgehog_lock/services/auth_controller.dart';
import 'package:hedgehog_lock/services/payemnt_controller.dart';

import '../../../model/pay_package_model.dart';
import '../../../widgets/website_page.dart';
import '../controller/seventeen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/widgets/custom_button.dart';

// ignore: must_be_immutable
class SeventeenItemWidget extends StatelessWidget {
  SeventeenItemWidget(this.payPackageModel, this.index);

  PayPackageModel payPackageModel;
  int index = 3;
  var controller = Get.find<SeventeenController>();
  var authController = Get.find<AuthController>();
  var paymentController = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CommonImageView(
              imagePath: ImageConstant.imgMaskgroup,
              height: getVerticalSize(
                MediaQuery.of(context).size.height * 0.9,
              ),
              width: getHorizontalSize(
                381.00,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 24,
                // top: 27,
                right: 25,
                bottom: 23,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 79,
                        right: 79,
                      ),
                      child: Image.asset(
                        payPackageModel.img ?? "",
                        height: getSize(
                          150.00,
                        ),
                        width: getSize(
                          150.00,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: getMargin(
                        left: 50,
                        //top: 26,
                        right: 50,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl_hedgehog2".tr,
                              style: TextStyle(
                                color: ColorConstant.gray900,
                                fontSize: getFontSize(
                                  24,
                                ),
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: payPackageModel.payName!.split(" ")[1],
                              style: TextStyle(
                                color: ColorConstant.indigo903,
                                fontSize: getFontSize(
                                  24,
                                ),
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: getMargin(
                        left: 79,
                        top: 13,
                        right: 79,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "\$ ${payPackageModel.price}".tr,
                              style: TextStyle(
                                color: ColorConstant.indigo903,
                                fontSize: getFontSize(
                                  24,
                                ),
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: " / Month".tr,
                              style: TextStyle(
                                color: ColorConstant.gray900,
                                fontSize: getFontSize(
                                  20,
                                ),
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    height: getVerticalSize(
                      1.00,
                    ),
                    width: getHorizontalSize(
                      332.00,
                    ),
                    margin: getMargin(
                      top: 15,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.gray200,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 15,
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
                            svgPath: ImageConstant.imgCheckmark1,
                            height: getSize(
                              20.00,
                            ),
                            width: getSize(
                              20.00,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 10,
                            top: 1,
                          ),
                          child: Text(
                            "${(payPackageModel.storageBytes! / (1000 * 1000 * 1000)).toStringAsFixed(0)} GB Storage"
                                .tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtUrbanistRomanSemiBold16Gray900,
                          ),
                        ),
                        // Padding(
                        //   padding: getPadding(
                        //     left: 10,
                        //     top: 1,
                        //   ),
                        //   child: Text(
                        //     "${(payPackageModel.storageBytes! / (1000 * 1000 * 1000)).toStringAsFixed(0)} GB Storage"
                        //         .tr,
                        //     overflow: TextOverflow.ellipsis,
                        //     textAlign: TextAlign.left,
                        //     style: AppStyle.txtUrbanistRomanSemiBold16Gray900,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 15,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 1,
                          ),
                          child: CommonImageView(
                            svgPath: ImageConstant.imgCheckmark1,
                            height: getSize(
                              20.00,
                            ),
                            width: getSize(
                              20.00,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 10,
                            bottom: 1,
                          ),
                          child: Text(
                            "Unlimited pinning".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtUrbanistRomanSemiBold16Gray900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 14,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 1,
                          ),
                          child: CommonImageView(
                            svgPath: ImageConstant.imgCheckmark1,
                            height: getSize(
                              20.00,
                            ),
                            width: getSize(
                              20.00,
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 10,
                            bottom: 1,
                          ),
                          child: Text(
                            "Encryption access".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtUrbanistRomanSemiBold16Gray900,
                          ),
                        ),

                        // Padding(
                        //   padding: getPadding(
                        //     left: 10,
                        //     bottom: 1,
                        //   ),
                        //   child: Text(
                        //     "${payPackageModel.bandwidth} GB Bandwidth".tr,
                        //     overflow: TextOverflow.ellipsis,
                        //     textAlign: TextAlign.left,
                        //     style: AppStyle.txtUrbanistRomanSemiBold16Gray900,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: getPadding(
                  //     top: 15,
                  //     right: 10,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Padding(
                  //         padding: getPadding(
                  //           top: 1,
                  //         ),
                  //         child: CommonImageView(
                  //           svgPath: ImageConstant.imgCheckmark1,
                  //           height: getSize(
                  //             20.00,
                  //           ),
                  //           width: getSize(
                  //             20.00,
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: getPadding(
                  //           left: 10,
                  //           bottom: 1,
                  //         ),
                  //         child: Text(
                  //           "${payPackageModel.devices} Devices".tr,
                  //           overflow: TextOverflow.ellipsis,
                  //           textAlign: TextAlign.left,
                  //           style: AppStyle.txtUrbanistRomanSemiBold16Gray900,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  if (Platform.isIOS)
                    Text(
                      payPackageModel.description ?? "",
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 10),
                    ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => WebsitePage(
                                  url:
                                      'https://sites.google.com/view/privacy-policy--hedgehog/home',
                                ));
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 25,
                            ),
                            child: Text(
                              "Privacy Policy".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => WebsitePage(
                                  url:
                                      'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
                                ));
                          },
                          child: Padding(
                            padding: getPadding(
                              left: 25,
                            ),
                            child: Text(
                              "Terms of Use (EULA)".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  authController.userCustomModel.value.payPackageId !=
                              payPackageModel.payId &&
                          index != 3
                      ? CustomButton(
                          onTap: () {
                            paymentController.makePurchases(index);
                          },
                          width: 332,
                          text: "lbl_choose_option".tr,
                          margin: getMargin(
                            top: 16,
                          ),
                          variant: ButtonVariant.GradientIndigo906Indigo900,
                          shape: ButtonShape.RoundedBorder13,
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
