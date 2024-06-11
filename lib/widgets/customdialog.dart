// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class CustomDialog {
  // static void showLoading(
  //     {String msg = 'Please Wait', bool backDismiss = true}) async {
  //   // SmartDialog.showLoading(msg: msg, backDismiss: backDismiss);
  // }

  static void showLoading(
    String title,
    String message,
  ) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black54,
      colorText: Colors.white,
    );
  }

  static void hide() {
    if (Get.isDialogOpen != null) {
      Get.back();
    }
  }
}
