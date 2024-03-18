import '../controller/home_menu_controller.dart';
import '../models/autolayouthor_item_model.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';

// ignore: must_be_immutable
class AutolayouthorItemWidget extends StatelessWidget {
  AutolayouthorItemWidget(this.autolayouthorItemModelObj);

  AutolayouthorItemModel autolayouthorItemModelObj;

  var controller = Get.find<HomeMenuController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        margin: getMargin(
          right: 12,
        ),
        padding: getPadding(
          left: 20,
          top: 9,
          right: 20,
          bottom: 9,
        ),
        decoration: AppDecoration.txtFillIndigo903.copyWith(
          borderRadius: BorderRadiusStyle.txtCircleBorder19,
        ),
        child: Text(
          "lbl_all".tr,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtUrbanistSemiBold16.copyWith(
            letterSpacing: 0.20,
          ),
        ),
      ),
    );
  }
}
