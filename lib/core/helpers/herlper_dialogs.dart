import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class HelperDialog{
  static errorDialog(title,message){
    PanaraInfoDialog.show(
      Get.context!,
      title: title,
      message: message,
      buttonText: "Okay",
      color: Colors.yellow,
      onTapDismiss: () => Get.back(),
      panaraDialogType: PanaraDialogType.error,
      barrierDismissible: false,
    );
  }
  static successfulDialog(title,message){
    PanaraInfoDialog.show(
      Get.context!,
      title: title,
      message: message,
      buttonText: "Okay",
      color: Colors.yellow,
      onTapDismiss: () => Get.back(),
      panaraDialogType: PanaraDialogType.success,
      barrierDismissible: false,
    );
  }
  static warningDialog(title,message){
    PanaraInfoDialog.show(
      Get.context!,
      color: Colors.yellow,
      title: title,
      message: message,
      buttonText: "Okay",
      onTapDismiss: () => Get.back(),
      panaraDialogType: PanaraDialogType.warning,
      barrierDismissible: false,
    );
  }
  static nbToast(String title,{color = Colors.green}){
    toast(title,bgColor: color);
  }
}