import 'controller/loading_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';

class LoadingPageScreen extends GetWidget<LoadingPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: getPadding(left: 46, top: 158, right: 46),
                  child: CommonImageView(
                      imagePath: ImageConstant.img2952,
                      height: getVerticalSize(112.00),
                      width: getHorizontalSize(200.00))),
              Container(
                  margin: getMargin(left: 46, top: 29, right: 46),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "lbl_hedgehog".tr,
                            style: TextStyle(
                                color: ColorConstant.gray900,
                                fontSize: getFontSize(48),
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w600)),
                        // TextSpan(
                        //     text: "lbl_lock".tr,
                        //     style: TextStyle(
                        //         color: ColorConstant.indigo900,
                        //         fontSize: getFontSize(48),
                        //         fontFamily: 'Urbanist',
                        //         fontWeight: FontWeight.w600))
                      ]),
                      textAlign: TextAlign.left)),
              Container(
                width: getHorizontalSize(335.00),
                margin: getMargin(left: 46, top: 24, right: 45),
                child: Text(
                  "Share, save, and manage data in a decentralized network worldwide.".tr,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtUrbanistSemiBold18
                      .copyWith(letterSpacing: 0.20),
                ),
              ),
              Padding(
                padding: getPadding(left: 46, top: 300, right: 46, bottom: 5),
                child: CircularProgressIndicator(),
              ),
              // Padding(
              //   padding: getPadding(left: 46, top: 300, right: 46, bottom: 5),
              //   child: CommonImageView(
              //     imagePath: ImageConstant.imgVector,
              //     height: getSize(60.00),
              //     width: getSize(60.00),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
