import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/assets.dart';

class SelectedHorseWidget extends StatefulWidget {
  const SelectedHorseWidget({super.key});
  @override
  State<SelectedHorseWidget> createState() => _SelectedHorseWidgetState();
}

class _SelectedHorseWidgetState extends State<SelectedHorseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16,right: 16,top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Selected Horses".toUpperCase(),style:Get.textTheme.bodyMedium),
          SizedBox(height: 10),
          Image.asset(
            h1,
            height: 39,
            width: 39,
          ),
          SizedBox(height: 6),
          Container(
            width: 60,
            alignment: Alignment.center,
            child: Text("Harry",style:Get.textTheme.bodyMedium!.copyWith(
            fontSize: 12,
          )),),
          SizedBox(height: 6),
          Container(height: 1,color: Color(0xffD7D7D7),),
        ],
      ),
    );
  }
}
