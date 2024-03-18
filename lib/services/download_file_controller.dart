import 'dart:developer';

import 'package:hedgehog_lock/core/app_export.dart';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:open_file_plus/open_file_plus.dart';

import '../model/file_custom_model.dart';

class DownloadFileController extends GetxController {
  getFileFromUrl(FileCustomModel fileCustomModel) async {
    if (await Permission.storage.isDenied) {
      await Permission.storage.request();
    }
    Get.defaultDialog(
        title: "Opening",
        content: CircularProgressIndicator(),
        barrierDismissible: false);
    try {
      var data = await http.get(Uri.parse(fileCustomModel.fileUrl ?? ""));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/${fileCustomModel.fileName}");
      File urlFile = await file.writeAsBytes(bytes);
      Get.back();
      await OpenFile.open(urlFile.path);
    } catch (e) {
      Get.back();
      log(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
