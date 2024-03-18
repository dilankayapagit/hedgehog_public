// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hedgehog_lock/constants/constants.dart';

import '../../core/theme/app_style.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/custom_button.dart';

class PayAcceptPage extends StatelessWidget {
  final int? index;
  const PayAcceptPage({
    Key? key,
    this.index = 3,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: ColorConstant.whiteA700,
      body: Container(
        width: size.width,
        height: size.height,
        child: Container(
          width: size.width,
          padding: getPadding(
            left: 29,
            top: 78,
            right: 29,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getVerticalSize(
                  353.00,
                ),
                width: getHorizontalSize(
                  313.00,
                ),
                child: Image.asset(
                    Constants.payPackageModelList[index!].img ?? ""),
              ),
              Padding(
                padding: getPadding(
                  top: 59,
                ),
                child: Text(
                  "lbl_congratulations".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium20.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.20,
                    ),
                    height: getVerticalSize(
                      1.00,
                    ),
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(
                  278.00,
                ),
                margin: getMargin(
                  top: 20,
                ),
                child: Text(
                  "Now your a ${Constants.payPackageModelList[index!].payName} Member",
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtPoppinsRegular15.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.15,
                    ),
                    height: getVerticalSize(
                      1.00,
                    ),
                  ),
                ),
              ),
              CustomButton(
                onTap: () {
                  Get.back();
                },
                width: 251,
                text: "lbl_continue".tr,
                margin: getMargin(
                  top: 29,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
