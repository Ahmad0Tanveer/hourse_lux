import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyText{
  static Widget text(text){
    return Row(
      children: [
        SizedBox(width: 10),
        Text(text,style: Get.theme.textTheme.labelSmall),
      ],
    );
  }
}