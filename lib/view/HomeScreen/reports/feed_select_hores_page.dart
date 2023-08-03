import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';

import '../../customs/custom_text.dart';
import 'add_feed_page.dart';

class FeedSelectHorsePage extends StatefulWidget {
  const FeedSelectHorsePage({super.key});
  @override
  State<FeedSelectHorsePage> createState() => _FeedSelectHorsePageState();
}

class _FeedSelectHorsePageState extends State<FeedSelectHorsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            child: ListView(
              children: [
                CustomAppBar2(title: "Feed"),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 24,right: 24),
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 10,left: 16),
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
                InkWell(
                  onTap: () => Get.to(() => AddFeedPage()),
                  child: Container(
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
                        Icon(Icons.arrow_forward_ios_sharp),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                  height: 1,color: Color(0xffD7D7D7),),
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
                      Icon(Icons.arrow_forward_ios_sharp),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                  height: 1,color: Color(0xffD7D7D7),),
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
                      Icon(Icons.arrow_forward_ios_sharp),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                  height: 1,color: Color(0xffD7D7D7),),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
