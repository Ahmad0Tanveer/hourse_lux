import 'package:flutter/material.dart';
import 'package:hourse_lux/core/constant/colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final Function()? onTap;
  // final String? fontFamily;

  const CustomText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 16.0,
    this.fontWeight,
    this.fontStyle,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.onTap,
    // this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DefaultTextStyle(
        style: TextStyle(
          fontFamily: 'Quicksand',
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        ),
        child: Text(
          text!,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        ),
      ),
    );
  }
}
