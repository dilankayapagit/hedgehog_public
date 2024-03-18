import 'package:firebase_auth/firebase_auth.dart';

import 'controller/eight_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_image.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_title.dart';
import 'package:hedgehog_lock/widgets/app_bar/custom_app_bar.dart';
import 'package:hedgehog_lock/widgets/custom_button.dart';
import 'package:hedgehog_lock/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EightScreen extends GetWidget<EightController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              onTap: onTapArrowleft),
          title: AppbarTitle(
              text: "lbl_chnage_pw".tr, margin: getMargin(left: 16))),
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: getPadding(left: 24, top: 19, right: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: getPadding(right: 10),
                      child: Text("lbl_old_pw".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtUrbanistRomanBold18Gray900)),
                  CustomTextFormField(
                    width: 380,
                    // focusNode: FocusNode(),
                    controller: controller.oldPw,
                    hintText: "lbl_old_pw".tr,
                    margin: getMargin(
                      left: 24,
                      top: 20,
                      right: 24,
                    ),
                    variant: TextFormFieldVariant.FillGray50,
                    shape: TextFormFieldShape.RoundedBorder12,
                    padding: TextFormFieldPadding.PaddingAll21,
                    fontStyle: TextFormFieldFontStyle.UrbanistRegular14,
                    textInputAction: TextInputAction.done,
                    prefix: Container(
                      margin: getMargin(
                        left: 20,
                        top: 20,
                        right: 12,
                        bottom: 20,
                      ),
                      child: CommonImageView(
                        svgPath: ImageConstant.imgLock,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      minWidth: getSize(
                        20.00,
                      ),
                      minHeight: getSize(
                        20.00,
                      ),
                    ),
                  ),
                  Padding(
                      padding: getPadding(top: 25, right: 10),
                      child: Text("lbl_new_pw".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtUrbanistRomanBold18Gray900)),
                  CustomTextFormField(
                    width: 380,
                    // focusNode: FocusNode(),
                    controller: controller.newPw,
                    hintText: "lbl_new_pw".tr,
                    margin: getMargin(
                      left: 24,
                      top: 20,
                      right: 24,
                    ),
                    variant: TextFormFieldVariant.FillGray50,
                    shape: TextFormFieldShape.RoundedBorder12,
                    padding: TextFormFieldPadding.PaddingAll21,
                    fontStyle: TextFormFieldFontStyle.UrbanistRegular14,
                    textInputAction: TextInputAction.done,
                    prefix: Container(
                      margin: getMargin(
                        left: 20,
                        top: 20,
                        right: 12,
                        bottom: 20,
                      ),
                      child: CommonImageView(
                        svgPath: ImageConstant.imgLock,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      minWidth: getSize(
                        20.00,
                      ),
                      minHeight: getSize(
                        20.00,
                      ),
                    ),
                  ),
                  CustomButton(
                    onTap: () {
                      
                      controller.changePassword();
                    },
                    width: 380,
                    text: "lbl_change".tr,
                    margin: getMargin(top: 24),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft() {
    Get.back();
  }
}
