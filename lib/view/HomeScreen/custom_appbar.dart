import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/assets.dart';
import '../../core/constant/colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 70,
      color: darkBlueColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.menu,
              color: whiteColor,
              size: 25.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Image.asset(
              appLogo2,
              width: 160.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.menu,
              color: Colors.transparent,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}
