import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../model/file_custom_model.dart';
import '../model/pay_package_model.dart';

class Constants {
  static const String server = "";

  static const String urlGetFile = "https://ipfs.io/ipfs/";

  static String getImg(FileCustomModel? fileUploadModel) {
    if (['doc'].contains(fileUploadModel!.fileType)) {
      return ImageConstant.doc;
    }
    if (['bmp'].contains(fileUploadModel.fileType)) {
      return ImageConstant.bmp;
    }
    if (['eps'].contains(fileUploadModel.fileType)) {
      return ImageConstant.eps;
    }
    if (['pdf'].contains(fileUploadModel.fileType)) {
      return ImageConstant.pdf;
    }
    if (['zip'].contains(fileUploadModel.fileType)) {
      return ImageConstant.zip;
    }
    if (['iso'].contains(fileUploadModel.fileType)) {
      return ImageConstant.iso;
    }
    if (['java'].contains(fileUploadModel.fileType)) {
      return ImageConstant.java;
    }

    //
    if (['txt'].contains(fileUploadModel.fileType)) {
      return ImageConstant.txt;
    }
    if (['rss'].contains(fileUploadModel.fileType)) {
      return ImageConstant.rss;
    }
    if (['ai'].contains(fileUploadModel.fileType)) {
      return ImageConstant.ai;
    }
    if (['csv'].contains(fileUploadModel.fileType)) {
      return ImageConstant.csv;
    }
    if (['mpeg'].contains(fileUploadModel.fileType)) {
      return ImageConstant.mpeg;
    }
    if (['tiff'].contains(fileUploadModel.fileType)) {
      return ImageConstant.tiff;
    }
    if (['wma'].contains(fileUploadModel.fileType)) {
      return ImageConstant.wma;
    }

    //
    if (['dill'].contains(fileUploadModel.fileType)) {
      return ImageConstant.dill;
    }
    if (['png'].contains(fileUploadModel.fileType)) {
      return ImageConstant.png;
    }
    if (['dwg'].contains(fileUploadModel.fileType)) {
      return ImageConstant.dwg;
    }
    if (['wav'].contains(fileUploadModel.fileType)) {
      return ImageConstant.wav;
    }
    if (['xml'].contains(fileUploadModel.fileType)) {
      return ImageConstant.xml;
    }
    if (['mp4'].contains(fileUploadModel.fileType)) {
      return ImageConstant.mp4;
    }
    if (['gif'].contains(fileUploadModel.fileType)) {
      return ImageConstant.gif;
    }
//
    if (['svg'].contains(fileUploadModel.fileType)) {
      return ImageConstant.svg;
    }
    if (['ps'].contains(fileUploadModel.fileType)) {
      return ImageConstant.ps;
    }
    if (['rar'].contains(fileUploadModel.fileType)) {
      return ImageConstant.rar;
    }
    if (['mov'].contains(fileUploadModel.fileType)) {
      return ImageConstant.mov;
    }
    if (['raw'].contains(fileUploadModel.fileType)) {
      return ImageConstant.raw;
    }
    if (['mid'].contains(fileUploadModel.fileType)) {
      return ImageConstant.mid;
    }
    if (['pub'].contains(fileUploadModel.fileType)) {
      return ImageConstant.pub;
    }

    //
    if (['crd'].contains(fileUploadModel.fileType)) {
      return ImageConstant.crd;
    }
    if (['docx'].contains(fileUploadModel.fileType)) {
      return ImageConstant.docx;
    }
    if (['xsl'].contains(fileUploadModel.fileType)) {
      return ImageConstant.xsl;
    }
    if (['ppt'].contains(fileUploadModel.fileType)) {
      return ImageConstant.ppt;
    }
    if (['jpg'].contains(fileUploadModel.fileType)) {
      return ImageConstant.jpg;
    }
    if (['mdb'].contains(fileUploadModel.fileType)) {
      return ImageConstant.mdb;
    }
    if (['mp3'].contains(fileUploadModel.fileType)) {
      return ImageConstant.mp3;
    }

//
    if (['avi'].contains(fileUploadModel.fileType)) {
      return ImageConstant.avi;
    }
    if (['html'].contains(fileUploadModel.fileType)) {
      return ImageConstant.html;
    }
    if (['exe'].contains(fileUploadModel.fileType)) {
      return ImageConstant.exe;
    }
    if (['psd'].contains(fileUploadModel.fileType)) {
      return ImageConstant.psd;
    }
    if (['flv'].contains(fileUploadModel.fileType)) {
      return ImageConstant.flv;
    }

    return ImageConstant.doc;
  }

  static List<PayPackageModel> payPackageModelList = [
    PayPackageModel(
        payName: "Hedgehog Basic",
        payId: "hedgehog_basic",
        price: "2.95",
        storageBytes: 500 * 1000 * 1000 * 1000,
        bandwidth: 80,
        devices: 3,
        img: ImageConstant.iconBasic,
        description: Platform.isIOS
            ? "• Auto-renewable subscription. • 1 month (\$2.95) durations. • Your subscription will be charged to your iTunes account at confirmation of purchase and will automatically renew (at the duration selected) unless auto-renew is turned off at least 24 hours before the end of the current period. • Current subscription may not be cancelled during the active subscription period; however, you can manage your subscription and/or turn off auto-renewal by visiting your iTunes Account Settings after purchase."
            : ""),
    PayPackageModel(
        payName: "Hedgehog Pro",
        payId: "hedgehog_pro",
        price: "4.95",
        storageBytes: 1000 * 1000 * 1000 * 1000,
        bandwidth: 900,
        devices: 15,
        img: ImageConstant.iconPro,
        description: Platform.isIOS
            ? "• Auto-renewable subscription. • 1 month (\$4.95) durations. • Your subscription will be charged to your iTunes account at confirmation of purchase and will automatically renew (at the duration selected) unless auto-renew is turned off at least 24 hours before the end of the current period. • Current subscription may not be cancelled during the active subscription period; however, you can manage your subscription and/or turn off auto-renewal by visiting your iTunes Account Settings after purchase."
            : ""),
    PayPackageModel(
      payName: "Hedgehog Singular",
      payId: "hedgehog_singular",
      price: "9.95",
      storageBytes: 3000 * 1000 * 1000 * 1000,
      bandwidth: 2500,
      devices: 30,
      img: ImageConstant.iconSingular,
      description: Platform.isIOS
          ? "• Auto-renewable subscription. • 1 month (\$9.95) durations. • Your subscription will be charged to your iTunes account at confirmation of purchase and will automatically renew (at the duration selected) unless auto-renew is turned off at least 24 hours before the end of the current period. • Current subscription may not be cancelled during the active subscription period; however, you can manage your subscription and/or turn off auto-renewal by visiting your iTunes Account Settings after purchase."
          : "",
    ),
    PayPackageModel(
        payName: "Hedgehog Free",
        payId: "hedgehog_free",
        price: "0",
        storageBytes: 15 * 1000 * 1000 * 1000,
        bandwidth: 1,
        devices: 1,
        img: ImageConstant.iconFree,
        description: ""),
  ];

  static PayPackageModel getPayPackage(String payId) {
    for (var element in payPackageModelList) {
      if (element.payId == payId) {
        return element;
      }
    }
    return payPackageModelList[3];
  }

  static buildDecoration() {
    return InputDecoration(
      hintText: "msg_search_for_documents".tr,
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  static _setOutlineBorderRadius() {
    return BorderRadius.circular(getHorizontalSize(
      12.00,
    ));
  }

  static _setBorderStyle() {
    return OutlineInputBorder(
      borderRadius: _setOutlineBorderRadius(),
      borderSide: BorderSide.none,
    );
  }

  static _setFillColor() {
    return ColorConstant.gray101;
  }

  static _setFilled() {
    return true;
  }

  static _setPadding() {
    return getPadding(
      all: 19,
    );
  }
}
