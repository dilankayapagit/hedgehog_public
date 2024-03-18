import '../controller/home_menu_controller.dart';
import '../models/home_menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';

// ignore: must_be_immutable
class HomeMenuItemWidget extends StatelessWidget {
  HomeMenuItemWidget(this.homeMenuItemModelObj);

  HomeMenuItemModel homeMenuItemModelObj;

  var controller = Get.find<HomeMenuController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillGray50.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 16,
                top: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CommonImageView(
                    svgPath: ImageConstant.imgMenu38x32,
                    height: getVerticalSize(
                      38.00,
                    ),
                    width: getHorizontalSize(
                      32.00,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      bottom: 27,
                    ),
                    child: CommonImageView(
                      svgPath: ImageConstant.imgGroup3,
                      height: getVerticalSize(
                        11.00,
                      ),
                      width: getHorizontalSize(
                        2.00,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 7,
              right: 16,
            ),
            child: Text(
              "lbl_loan_contract".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtUrbanistSemiBold16Gray900.copyWith(
                letterSpacing: 0.20,
                height: 1.25,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 1,
              right: 16,
              bottom: 12,
            ),
            child: Text(
              "msg_created_10_01_2022".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtUrbanistRomanRegular12.copyWith(
                letterSpacing: 0.20,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
