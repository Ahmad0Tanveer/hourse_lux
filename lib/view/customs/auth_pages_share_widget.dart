import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constant/colors.dart';
import 'custom_text.dart';

class AuthPagesShareWidget extends StatelessWidget {
  final List<Widget> children;
  final String? textOne;
  final String? textTwo;
  const AuthPagesShareWidget(
      {super.key, this.children = const [], this.textOne, this.textTwo});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 80.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(
                      text: textOne ?? '', color: blackColor, fontSize: 30.sp),
                  SizedBox(height: 10.h),
                  CustomText(
                      text: textTwo ?? '', color: blackColor, fontSize: 22.sp),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 110.h),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 80.h),
                  decoration: BoxDecoration(
                    color: darkBlueColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.h),
                    child: SingleChildScrollView(
                        child: Column(children: children)),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}