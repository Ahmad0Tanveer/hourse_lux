import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/view/HomeScreen/service_records/add_body_cliper_page.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/selected_horses_widget.dart';

class ServiceRecordTypePage extends StatelessWidget {
  const ServiceRecordTypePage({super.key});
  @override
  Widget build(BuildContext context) {
    Widget breadWidget(title,price){
      return Container(
        margin: EdgeInsets.only(left: 16,right: 16),
        child: Column(
          children: [
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Row(
                  children: [
                    Text("\$ $price",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 15)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios_rounded,size: 20),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(height: 1,color: Color(0xffD7D7D7),)
          ],
        ),
      );
    }
    Widget arrowWidget(title){
      return Container(
        margin: EdgeInsets.only(left: 16,right: 16),
        child: Column(
          children: [
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Icon(Icons.arrow_forward_ios_rounded,size: 20),
              ],
            ),
            SizedBox(height: 10),
            Container(height: 1,color: Color(0xffD7D7D7),),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar2(title: "Choose Record Type"),
          SizedBox(height: 10),
          SelectedHorseWidget(),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text("Choose Record Type",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
          ),
          SizedBox(height: 10),
          InkWell(
              onTap: () => Get.to(() => AddBodyClipperPage()),
              child: breadWidget("Bodyclip","100")),
          breadWidget("Coaching (Daily)","100"),
          arrowWidget("Equipment"),
          breadWidget("Flat Rate","3,000"),
          breadWidget("Lesson","65"),
          arrowWidget("Lodging"),
          breadWidget("Longe","30"),
          breadWidget("Monthly Board","1,100"),
          breadWidget("Office Fee","25"),
          arrowWidget("Other"),
          breadWidget("Ride","50"),
          breadWidget("Show Ride","50"),
          arrowWidget("Travel Expense"),
          breadWidget("Treadmill","20"),
          breadWidget("Treadmill","30"),
          breadWidget("Warmup Ride","50"),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
