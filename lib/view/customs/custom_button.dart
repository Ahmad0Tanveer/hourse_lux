import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hourse_lux/core/constant/colors.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    this.press,
    this.fontsize,
    this.fontWeight,
    this.gradientColors = const [
      buttonFourColor,
      buttonThirdColor,
      buttonSecondColor,
      buttonStartColor,
    ], // Set your desired gradient colors
    this.textColor = blackColor,
    this.horizontalPadding = 20.0,
    this.borderRadius = 48.0,
  }) : super(key: key);

  final String text;
  final Function? press;
  final double? fontsize;
  final FontWeight? fontWeight;
  final List<Color> gradientColors;
  final Color textColor;
  final double horizontalPadding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
            backgroundColor: Colors.transparent,
          ),
          onPressed: press as void Function()?,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Source Sans Pro",
              fontSize: fontsize,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    this.press,
    this.fontsize,
    this.fontWeight,
    this.buttonColor = darkBlueColor,
    this.textColor = Colors.white,
    this.shadowColor = Colors.grey,
    this.elevation = 10.0,
    this.horizontalPadding = 20.0,
    this.borderRadius = 48.0,
  }) : super(key: key);

  final String text;
  final Function? press;
  final double? fontsize;
  final FontWeight? fontWeight;
  final Color buttonColor;
  final Color textColor;
  final Color shadowColor;
  final double elevation;
  final double horizontalPadding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 72.h,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
          foregroundColor: textColor,
          // shadowColor: shadowColor,
          // elevation: elevation,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
          backgroundColor: buttonColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "sego ui normal",
            fontSize: fontsize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
