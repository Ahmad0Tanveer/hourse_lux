import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hourse_lux/core/constant/colors.dart';

class CustomSearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          color: Color(0xffF4F6F9),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  cursorColor: darkBlueColor,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Icon(Icons.search),
            ],
          ),
        ),
      ),
    );
  }
}
