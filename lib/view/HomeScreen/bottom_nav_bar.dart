import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/models/ui/bottom_bar_model.dart';

class BottomNavSheetScreen extends StatefulWidget {
  const BottomNavSheetScreen({super.key});
  @override
  State<BottomNavSheetScreen> createState() => _BottomNavSheetScreenState();
}

class _BottomNavSheetScreenState extends State<BottomNavSheetScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allBars[_currentIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: darkBlueColor,
        unselectedItemColor: greyColor.withOpacity(0.4),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected tab index
          });
        },
        items: allBars.map((e) => BottomNavigationBarItem(
          icon: Image.asset(
            e.image,
            height: 40.h,
            width: 40.w,
            color: _currentIndex == allBars.indexOf(e)  ? darkBlueColor : greyColor.withOpacity(0.4),
          ),
          label: e.label, // Replace with your own label
        ),).toList()
      ),
    );
  }
}
