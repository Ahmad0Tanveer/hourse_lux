import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/helpers/keys.dart';
import 'package:hourse_lux/main.dart';
import 'login_screen.dart';
import 'on_boarding_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      if(box.read(allKeys.boardingScreen)??false){
        Get.offAll(() => SignInScreen());
      } else {
        Get.offAll(() => OnboardingScreens());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            appLogo,
            width: 200,
            height: 200,
          ),
        ]),
      ),
    );
  }
}
