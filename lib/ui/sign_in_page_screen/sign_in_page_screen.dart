import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';

import 'controller/sign_in_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/core/utils/validation_functions.dart';
import 'package:hedgehog_lock/widgets/custom_button.dart';
import 'package:hedgehog_lock/widgets/custom_text_form_field.dart';

class SignInPageScreen extends StatefulWidget {
  @override
  State<SignInPageScreen> createState() => _SignInPageScreenState();
}

class _SignInPageScreenState extends State<SignInPageScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var controller = Get.put(SignInPageController());

  var checkedValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: SafeArea(
        child: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 24,
                      top: 75,
                      right: 24,
                    ),
                    child: CommonImageView(
                      imagePath: ImageConstant.img2952,
                      height: getVerticalSize(
                        89.00,
                      ),
                      width: getHorizontalSize(
                        160.00,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 24,
                      top: 54,
                      right: 24,
                    ),
                    child: Text(
                      "Sign In",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtUrbanistRomanBold20,
                    ),
                  ),
                  CustomTextFormField(
                    width: 380,
                    //focusNode: FocusNode(),
                    controller: controller.emailController,
                    hintText: "lbl_email".tr,
                    margin: getMargin(
                      left: 24,
                      top: 50,
                      right: 24,
                    ),
                    variant: TextFormFieldVariant.FillGray50,
                    shape: TextFormFieldShape.RoundedBorder12,
                    padding: TextFormFieldPadding.PaddingAll21,
                    fontStyle: TextFormFieldFontStyle.UrbanistRegular14,
                    prefix: Container(
                      margin: getMargin(
                        left: 20,
                        top: 20,
                        right: 12,
                        bottom: 20,
                      ),
                      child: CommonImageView(
                        svgPath: ImageConstant.imgCheckmark,
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
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                  Obx(
                    () => CustomTextFormField(
                      width: 380,
                      // focusNode: FocusNode(),
                      controller: controller.passwordController,
                      hintText: "lbl_password".tr,
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
                      suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword.value =
                              !controller.isShowPassword.value;
                        },
                        child: Container(
                          margin: getMargin(
                            left: 22,
                            top: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: CommonImageView(
                            svgPath: controller.isShowPassword.value
                                ? ImageConstant.imgCheckmark20x20
                                : ImageConstant.imgCheckmark20x20,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        minWidth: getHorizontalSize(
                          20.00,
                        ),
                        minHeight: getVerticalSize(
                          20.00,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || (value == "")) {
                          return "Please enter valid password";
                        }
                        return null;
                      },
                      isObscureText: !controller.isShowPassword.value,
                    ),
                  ),
                  CustomButton(
                    onTap: () {
                      if (controller.passwordController.text == "" ||
                          controller.emailController.text == "") {
                        _formKey.currentState!.validate();
                        Fluttertoast.showToast(
                            msg: "Please enter Email/Password",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        return;
                      }
                      if (!checkedValue) {
                        Fluttertoast.showToast(
                            msg: "Please check the check box",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        return;
                      }
                      controller.signIn();
                    },
                    width: 380,
                    text: "Sign In / Sign Up".tr,
                    margin: getMargin(
                      left: 24,
                      top: 20,
                      right: 24,
                    ),
                  ),
                  CustomButton(
                    onTap: () async {
                      if (!checkedValue) {
                        Fluttertoast.showToast(
                            msg: "Please check the check box",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        return;
                      }
                      controller.signInAnon();
                    },
                    width: 380,
                    text: "lbl_skip_for_now".tr,
                    margin: getMargin(
                      left: 24,
                      top: 20,
                      right: 24,
                    ),
                    variant: ButtonVariant.FillIndigoA100,
                  ),
                  Padding(
                    padding: getPadding(
                      left: 24,
                      top: 64,
                      right: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: getVerticalSize(
                            1.00,
                          ),
                          width: getHorizontalSize(
                            96.00,
                          ),
                          margin: getMargin(
                            top: 11,
                            bottom: 9,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.gray200,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 16,
                          ),
                          child: Text(
                            "msg_or_continue_with".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                AppStyle.txtUrbanistSemiBold18Gray700.copyWith(
                              letterSpacing: 0.20,
                            ),
                          ),
                        ),
                        Container(
                          height: getVerticalSize(
                            1.00,
                          ),
                          width: getHorizontalSize(
                            96.00,
                          ),
                          margin: getMargin(
                            left: 16,
                            top: 11,
                            bottom: 9,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.gray200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (!checkedValue) {
                            Fluttertoast.showToast(
                                msg: "Please check the check box",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 5,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            return;
                          }
                          controller.signInGmail();
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 40,
                              top: 20,
                            ),
                            child: Card(
                              elevation: 5,
                              child: CommonImageView(
                                svgPath: ImageConstant.imgFrameBlueA200,
                                height: getVerticalSize(
                                  30.00,
                                ),
                                width: getHorizontalSize(
                                  30.00,
                                ),
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      if (Platform.isIOS)
                        GestureDetector(
                          onTap: () async {
                            if (!checkedValue) {
                              Fluttertoast.showToast(
                                  msg: "Please check the check box",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 5,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              return;
                            }
                            controller.signInWithApple();
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: getPadding(
                                top: 20,
                                right: 40,
                              ),
                              child: Card(
                                elevation: 5,
                                child: CommonImageView(
                                  svgPath: ImageConstant.appleIcon,
                                  height: getVerticalSize(
                                    35.00,
                                  ),
                                  width: getHorizontalSize(
                                    35.00,
                                  ),
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CheckboxListTile(
                      title: Text(
                        "By signing in, you agree to Hedgehog's Privacy Policy and Terms & Conditions",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      value: checkedValue,

                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
