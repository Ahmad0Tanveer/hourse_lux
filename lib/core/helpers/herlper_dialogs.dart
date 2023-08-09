import 'package:get/get.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class HelperDialog{
  static errorDialog(title,message){
    PanaraInfoDialog.show(
      Get.context!,
      title: title,
      message: message,
      buttonText: "Okay",
      onTapDismiss: () => Get.back(),
      panaraDialogType: PanaraDialogType.normal,
      barrierDismissible: false,
    );
  }
}