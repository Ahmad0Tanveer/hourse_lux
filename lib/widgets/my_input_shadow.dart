import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyInputShadow extends StatefulWidget {
  final Widget widget;
  final String title;
  const MyInputShadow({super.key,required this.widget,required this.title});
  @override
  State<MyInputShadow> createState() => _MyInputShadowState();
}

class _MyInputShadowState extends State<MyInputShadow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 16),
          child: Text(widget.title,style: Get.textTheme.bodySmall),
        ),
        Card(
            elevation: 10,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: widget.widget
        ),
      ],
    );
  }
}
