import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';

import '../../../widgets/custom_appbar_2.dart';
import '../../customs/custom_text.dart';

class TemperatureReports extends StatefulWidget {
  const TemperatureReports({super.key});

  @override
  State<TemperatureReports> createState() => _TemperatureReportsState();
}

class _TemperatureReportsState extends State<TemperatureReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: "horse temperature reports")),
        preferredSize: Size.fromHeight(69),
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height,
            child: ListView(
              children: [
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                  child: Text("time frame".toUpperCase(),style: TextStyle(
                    color: baseColor,
                  ),),
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(left: 32,right: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("15 May 1999",style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff707070),
                      ),),
                      Text("-To-",style: TextStyle(color: Color(0xff707070),),),
                      Text("15 May 1999",style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff707070),
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: Get.width,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16),
                  child: Text("Monday, 24, JUNE, 2023",style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        h1,
                        height: 60.h,
                        width: 60.h,
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: "HARRY",
                                fontSize: 15.sp,
                                color: blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              CustomText(
                                text: "04:40 PM   90 F",
                                fontSize: 15.sp,
                                color: blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),

                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
