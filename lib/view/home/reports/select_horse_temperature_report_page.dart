import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/assets.dart';

import '../../../core/constant/colors.dart';
import '../../../widgets/custom_appbar_2.dart';
import '../../customs/custom_text.dart';
import 'temperature_reports_page.dart';

class SelectHorseTemperatureReportPage extends StatefulWidget {
  const SelectHorseTemperatureReportPage({super.key});
  @override
  State<SelectHorseTemperatureReportPage> createState() => _SelectHorseTemperatureReportPageState();
}

class _SelectHorseTemperatureReportPageState extends State<SelectHorseTemperatureReportPage> {
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
                      ),),
                      Text("-To-"),
                      Text("15 May 1999",style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10),
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16,top: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Color.fromRGBO(223, 226, 232,1),
                      filled: true,
                      hintText: "Search",
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(height: 16),
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
                                text: "Owner:",
                                fontSize: 14.sp,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: " Avalynn Bruce",
                                fontSize: 14.sp,
                                color: greyColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                        ],
                      ),
                      Spacer(),
                      Checkbox(
                          shape: CircleBorder(),
                          value: true,
                          onChanged: (val){}
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
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
                                text: "Owner:",
                                fontSize: 14.sp,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: " Avalynn Bruce",
                                fontSize: 14.sp,
                                color: greyColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                        ],
                      ),
                      Spacer(),
                      Checkbox(
                          shape: CircleBorder(),
                          value: false,
                          onChanged: (val){}
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
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
                                text: "Owner:",
                                fontSize: 14.sp,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: " Avalynn Bruce",
                                fontSize: 14.sp,
                                color: greyColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                        ],
                      ),
                      Spacer(),
                      Checkbox(
                          shape: CircleBorder(),
                          value: false,
                          onChanged: (val){}
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child:  Container(
              margin: EdgeInsets.only(left: 16,right: 16),
              child: GestureDetector(
                onTap: () => Get.to(() => TemperatureReports()),
                child: Container(
                  height: 55,
                  width: Get.width - 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text("Generate Report",style: Get.theme.textTheme.labelMedium),
                ),
              ),
            ),)
        ],
      ),
    );
  }
}
