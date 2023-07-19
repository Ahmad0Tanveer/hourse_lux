// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../core/constant/colors.dart';

void logWithTimestamp(String message) {
  final timestamp = DateTime.now().toString();
  log('[$timestamp] $message');
}

class Utils {
  static void fieldChanged(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static void show_Custom_Flushbar(String message, BuildContext context) {
    Flushbar(
      borderRadius: BorderRadius.circular(5),
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.error,
        color: blackColor,
      ),
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      backgroundGradient: LinearGradient(
        colors: [darkBlueColor, darkBlueColor, darkBlueColor],
        stops: const [0.4, 0.7, 1],
      ),
      boxShadows: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      message: message,
      messageColor: blackColor,
      messageSize: 14,
    ).show(context);
  }

  static void showDilog(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return const Center(
          child: CircularProgressIndicator(
            color: darkBlueColor,
            strokeWidth: 1.9,
          ),
        );
      }),
    );
  }
}
