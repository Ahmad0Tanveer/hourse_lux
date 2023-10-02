import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/service_controller.dart';
import 'package:hourse_lux/view/home/service_records/add_body_cliper_page.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/selected_horses_widget.dart';

class ServiceRecordTypePage extends StatefulWidget {
  const ServiceRecordTypePage({super.key});

  @override
  State<ServiceRecordTypePage> createState() => _ServiceRecordTypePageState();
}

class _ServiceRecordTypePageState extends State<ServiceRecordTypePage> {
  final service = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    Widget breadWidget(title,price){
      return Container(
        margin: EdgeInsets.only(left: 16,right: 16),
        child: Column(
          children: [
            SizedBox(height: 17),
            InkWell(
              onTap: () {
                service.setPrice(price);
                Get.to(() => AddBodyClipperPage(type: title));
              },
              child: Row(
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
            InkWell(
              onTap: (){
                service.setPrice("0");
                Get.to(() => AddBodyClipperPage(type: title));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                  Icon(Icons.arrow_forward_ios_rounded,size: 20),
                ],
              ),
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
          breadWidget("Bodyclip","100"),
          breadWidget("Coaching (Daily)","100"),
          arrowWidget("Equipment"),
          breadWidget("Flat Rate","3000"),
          breadWidget("Lesson","65"),
          arrowWidget("Lodging"),
          breadWidget("Longe","30"),
          breadWidget("Monthly Board","1100"),
          breadWidget("Office Fee","25"),
          arrowWidget("Other"),
          breadWidget("Ride","50"),
          breadWidget("Show Ride","50"),
          arrowWidget("Travel Expense"),
          breadWidget("Treadmill","20"),
          breadWidget("Warmup Ride","50"),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
