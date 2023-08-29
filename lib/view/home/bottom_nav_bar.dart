import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/models/ui/bottom_bar_model.dart';

class BottomNavSheetScreen extends StatefulWidget {
  const BottomNavSheetScreen({super.key});
  @override
  State<BottomNavSheetScreen> createState() => _BottomNavSheetScreenState();
}

class _BottomNavSheetScreenState extends State<BottomNavSheetScreen> {
  final nav = Get.put(MyNav());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: nav,
      builder: (_) {
        return Scaffold(
          body: allBars[nav.index].page,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: darkBlueColor,
              unselectedItemColor: greyColor.withOpacity(0.4),
              currentIndex: nav.index,
              onTap: nav.changeNav,
              items: allBars.map((e) => BottomNavigationBarItem(
                icon:   Image.asset(
                  e.image,
                  height: 40.h,
                  width: 40.w,
                  color: nav.index == allBars.indexOf(e)  ? darkBlueColor : greyColor.withOpacity(0.4),
                ),
                label: e.label, // Replace with your own label
              ),).toList()
          ),
        );
      }
    );
  }
}

class MyNav extends GetxController{
   int index = 0;
  void changeNav(page){
    print(page);
    index = page;
    update();
  }
}