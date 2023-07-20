import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyText{
  static Widget text(text){
    return Row(
      children: [
        Text(text,style: Get.theme.textTheme.labelSmall),
      ],
    );
  }
}