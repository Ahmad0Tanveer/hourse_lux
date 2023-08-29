import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';

class EventServiceType extends StatefulWidget {
  const EventServiceType({super.key});
  @override
  State<EventServiceType> createState() => _EventServiceTypeState();
}

class _EventServiceTypeState extends State<EventServiceType> {
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
    return SafeArea(child: Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar2(title: 'New Event',),
        preferredSize: Size.fromHeight(69),
      ),
      body: ListView(
        children: [
          InkWell(
              onTap: () {},
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
    ));
  }
}
