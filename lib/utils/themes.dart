import 'package:flutter/material.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  fontFamily: GoogleFonts.quicksand().fontFamily,
  textTheme: TextTheme(
    labelMedium: TextStyle(
       // fontFamily: 'Quicksand',
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    bodyLarge: TextStyle(
       // fontFamily: 'Quicksand',
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700
    ),
    bodySmall: TextStyle(
       // fontFamily: 'Quicksand',
        color: Color.fromRGBO(44, 58, 75,1),
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    bodyMedium: TextStyle(
      //  fontFamily: 'Quicksand',
        color: Color.fromRGBO(9, 16, 29,1),
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    //used and top Text on TextField
    labelSmall: TextStyle(
      //  fontFamily: 'Quicksand',
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
        fontWeight: FontWeight.w600,
        color: blackColor.withOpacity(0.4),
        fontSize: 16
    ),
  )
);