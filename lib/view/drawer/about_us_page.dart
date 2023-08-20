import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Image.asset("assets/images/women.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: Get.height,
            width: Get.width,
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 50),
                Image.asset("assets/images/logo2.png",height: 60),

                SizedBox(height: 32),
                Text("ABOUT US",style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.all(16),
                  child: Text("Lorem ipsum dolor sit amet, consectet ur adipiscing elit, sed do eiusmod temp or incididunt ut labore et dolore mag na aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequ at. Duis aute irure dolor in reprehend erit in voluptate velit esse cillum dol ore eu fugiat nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labo re et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat ion ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute iru re dolor in reprehenderit in voluptate velit esse cillum dol ore eu fugiat n",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
