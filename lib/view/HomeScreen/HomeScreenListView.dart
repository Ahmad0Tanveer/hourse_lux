import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/view/customs/custom_text.dart';

class HomeScreenListView extends StatefulWidget {
  const HomeScreenListView({super.key});

  @override
  State<HomeScreenListView> createState() => _HomeScreenListViewState();
}

class _HomeScreenListViewState extends State<HomeScreenListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              children: [
                Row(
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
                        Row(
                          children: [
                            CustomText(
                              text: "Sex:",
                              fontSize: 14.sp,
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: " colt",
                              fontSize: 14.sp,
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: blackColor,
                    )
                  ],
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(
                    thickness: 1,
                    color: greyColor.withOpacity(0.5),
                  ),
                )
              ],
            ),
            // Add more customization or widgets as needed for each item
          );
        },
      ),
    );
  }
}
