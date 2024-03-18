import 'controller/delte_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_image.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_title.dart';
import 'package:hedgehog_lock/widgets/app_bar/custom_app_bar.dart';
import 'package:hedgehog_lock/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class DeleteUserData extends StatefulWidget {
  @override
  State<DeleteUserData> createState() => _DeleteUserDataState();
}

class _DeleteUserDataState extends State<DeleteUserData> {
  var controller = Get.put(DeleteAccount());

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
          text: "Delete Account".tr,
          margin: getMargin(left: 16),
        ),
      ),
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
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onTap: () {
                      controller.deleteAccount();
                    },
                    variant: ButtonVariant.FillRed500,
                    width: 380,
                    text: "Delete Account Now".tr,
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
