// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import 'app_bar/appbar_image.dart';
import 'app_bar/appbar_title.dart';
import 'app_bar/custom_app_bar.dart';

class WebsitePage extends StatefulWidget {
  final String url;
  const WebsitePage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<WebsitePage> createState() => _WebsitePageState();
}

class _WebsitePageState extends State<WebsitePage> {
  var controller = WebViewController();

  @override
  void initState() {
    super.initState();

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: AppbarTitle(text: "Page", margin: getMargin(left: 16))),
        body: WebViewWidget(controller: controller));
  }
}
