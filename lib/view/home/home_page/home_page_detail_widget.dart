import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/horse_controller.dart';

class HomePageDetailWidget extends StatefulWidget {
  const HomePageDetailWidget({super.key});

  @override
  State<HomePageDetailWidget> createState() => _HomePageDetailWidgetState();
}

class _HomePageDetailWidgetState extends State<HomePageDetailWidget> {
  final horse = Get.put(HorseController());
  @override
  Widget build(BuildContext context) {
    var titleStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 17,
      color: baseColor,
    );
    Widget rowText(n,b){
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Text(n,style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: baseColor,
            ),),
            Text(b,style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xff636363),
            ),),
          ],
        ),
      );
    }
    return GetBuilder(
      init: horse,
      builder: (_) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text("INFORMATION",style: titleStyle),
              rowText("Nick Name: ", " ${horse.details.neckName}"),
              rowText("Show Name: ", "${horse.details.showName}"),
            //  rowText("Paddock Name: ", "${horse.details.}"),
              rowText("Paddock Location: ", "${horse.details.paddockLocation}"),
            //  rowText("Paddock Notes: ", " ${horse.details.}"),
              SizedBox(height: 10),
              Container(
                height: 1,color: Color(0xffD7D7D7),),
              SizedBox(height: 10),
              Text("stall Information".toUpperCase(),style: titleStyle),
              rowText("Stall #: ", " 24"),
              SizedBox(height: 10),
              Container(
                height: 1,color: Color(0xffD7D7D7),),
              SizedBox(height: 10),
              Text("important dates".toUpperCase(),style: titleStyle),
              rowText("Coggins Renewal Dates: ", " 25-Jun-2024"),
              rowText("Last Coggins Dates:  ", " 26-Jun-2023"),
              SizedBox(height: 10),
              Container(
                height: 1,color: Color(0xffD7D7D7),),
              SizedBox(height: 10),
            ],
          ),
        );
      }
    );
  }
}
