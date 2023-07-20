import 'package:flutter/material.dart';
import 'package:hourse_lux/core/constant/colors.dart';

ThemeData theme = ThemeData(

  textTheme: TextTheme(
    labelMedium: TextStyle(
        fontFamily: 'SOURCE SANS PRO',
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    bodyLarge: TextStyle(
        fontFamily: 'Quicksand',
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700
    ),
    //used and top Text on TextField
    labelSmall: TextStyle(
        fontFamily: 'SOURCE SANS PRO',
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(color: Color.fromRGBO(35, 205, 141, 1)),
    fillColor: MaterialStateProperty.all(Colors.white),
    checkColor: MaterialStateProperty.all(Color.fromRGBO(35, 205, 141, 1)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: whiteColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    hintStyle: TextStyle(
        fontFamily: 'SOURCE SANS PRO',
        fontWeight: FontWeight.w600,
        color: blackColor.withOpacity(0.4),
        fontSize: 16
    ),
  )
);