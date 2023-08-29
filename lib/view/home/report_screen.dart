import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/view/home/add_horses/herse_select_page.dart';
import 'package:hourse_lux/view/home/reports/owner_report_page.dart';

import 'home_screen.dart';
import 'reports/due_date_report_page.dart';
import 'reports/feed_select_hores_page.dart';
import 'reports/report_heaalth_page.dart';
import 'reports/reports_activity_page.dart';
import 'reports/select_horse_temperature_report_page.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
               Stack(
                 alignment: Alignment.center,
                 children: [
                   Container(
                     height: 230,
                     child: Image.asset("assets/icons/hhorse.png"),
                   ),
                   Align(
                     alignment: Alignment.center,
                     child: Text("Report",style: TextStyle(
                       color: Colors.white,
                       fontSize: 30
                     ),),
                   )
                 ],
               ),
              SizedBox(height: 10),
              Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Text("Horse Reports",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
              SizedBox(height: 26),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                runSpacing: 16,
                children: [
                  myTile("Activity", "assets/reports/DeliveryTime.png", ReportsActivityPage()),
                  myTile("Health", "assets/reports/heart.png", ReportHealthPage()),
                  myTile("Due Date", "assets/reports/DateTo.png", DueDateReportPage()),
                  myTile("Temperature", "assets/reports/Temperature.png", SelectHorseTemperatureReportPage()),
                  myTile("Ownership", "assets/reports/DeliveryTime.png",  HorseSelectPage(nextPage: OwnerReportPage(), title: "horse OWNER reports")),
                  myTile("Feeds", "assets/reports/Barley.png", FeedSelectHorsePage()),
                ],
              ),
              SizedBox(height: 40),
            ],
          )
        ),
      ),
    );
  }
  Widget myTile(title,image,next){
    return InkWell(
      onTap: () => Get.to(next),
      child: Container(
        width: 140,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25), // Shadow color
              spreadRadius: 5, // The spread radius of the shadow
              blurRadius: 10, // The blur radius of the shadow
              offset: Offset(0, 4), // The position of the shadow relative to the container
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,height: 64,width: 54),
            SizedBox(height: 5),
            Text(title,style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),),
          ],
        ),
      ),
    );
  }
}
