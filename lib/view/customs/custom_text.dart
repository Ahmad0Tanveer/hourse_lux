import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontFamily: GoogleFonts.quicksand().fontFamily,
        ),
        child: Text(
          text!,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: 2,
          style: TextStyle(
            fontFamily: GoogleFonts.quicksand().fontFamily,
          ),
        ),
      ),
    );
  }
}
