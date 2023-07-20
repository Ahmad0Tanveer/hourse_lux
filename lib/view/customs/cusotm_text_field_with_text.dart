/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constant/colors.dart';

class CustomTextField extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final String hintText;
  final String text;
  final Widget? suffixIcon;

  const CustomTextField({
    required this.height,
    required this.width,
    required this.backgroundColor,
    required this.hintText,
    this.suffixIcon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Text('$text',
                style: TextStyle(
                    fontFamily: 'SOURCE SANS PRO',
                    color: greyColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600
                ),
            )
        ),
        SizedBox(height: 15.h),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Align(
            alignment: Alignment.center,
            child: TextField(
              cursorColor: blackColor,
              cursorHeight: 20.h,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontFamily: 'SOURCE SANS PRO',
                    fontWeight: FontWeight.w600,
                    color: blackColor.withOpacity(0.4),
                    fontSize: 16.sp),
                suffixIcon: suffixIcon,
                hintText: hintText,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20.w, bottom: 20.h),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
*/
