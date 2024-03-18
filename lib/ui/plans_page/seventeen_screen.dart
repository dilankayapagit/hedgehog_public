import 'package:hedgehog_lock/ui/plans_page/widgets/seventeen_item_widget.dart';

import '../../model/pay_package_model.dart';
import '../../services/payemnt_controller.dart';
import 'controller/seventeen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hedgehog_lock/core/app_export.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_image.dart';
import 'package:hedgehog_lock/widgets/app_bar/appbar_title.dart';
import 'package:hedgehog_lock/widgets/app_bar/custom_app_bar.dart';

class SeventeenScreen extends GetWidget<SeventeenController> {
  var paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          height: getVerticalSize(56.00),
          actions: [
            TextButton(
                onPressed: () {
                  paymentController.restorePurchases();
                },
                child: Text("Restore Purchases")),
            SizedBox(
              width: 20,
            )
          ],
          leadingWidth: 52,
          leading: AppbarImage(
              height: getSize(28.00),
              width: getSize(28.00),
              svgPath: ImageConstant.imgArrowleft,
              margin: getMargin(left: 24, top: 12, bottom: 15),
              onTap: onTapArrowleft9),
          title:
              AppbarTitle(text: "lbl_payment".tr, margin: getMargin(left: 16))),
      body: SingleChildScrollView(
        child: Padding(
          padding: getPadding(left: 24, top: 9, right: 23, bottom: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //
              Padding(
                padding: getPadding(top: 24),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Constants.payPackageModelList.length,
                  itemBuilder: (context, index) {
                    PayPackageModel model =
                        Constants.payPackageModelList[index];
                    return SeventeenItemWidget(model, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapArrowleft9() {
    Get.back();
  }
}
