import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/view/Contact/contact_screen.dart';
import 'package:hourse_lux/view/HomeScreen/home_screen.dart';
import 'package:hourse_lux/view/HorseCatogories/horse_catogories.dart';
import 'package:hourse_lux/view/ReportScreen/report_screen.dart';
import 'package:hourse_lux/view/ScheduleScreen/schedule_screen.dart';

class BottomNavSheetScreen extends StatefulWidget {
  const BottomNavSheetScreen({super.key});

  @override
  State<BottomNavSheetScreen> createState() => _BottomNavSheetScreenState();
}

class _BottomNavSheetScreenState extends State<BottomNavSheetScreen> {
  int _currentIndex = 0; // Index of the currently selected tab

  // List of pages or sections to be displayed in the bottom navigation bar
  final List<Widget> _pages = [
    HomeScreen(), // Replace PageOne() with your own widget
    ContactScreen(),
    HoreseCatagories(), // Replace PageTwo() with your own widget
    ScheduleScreen(),
    ReportScreen(), // Replace PageThree() with your own widget
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
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
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              horse,
              height: 40.h,
              width: 40.w,
              color: _currentIndex == 0
                  ? darkBlueColor
                  : greyColor.withOpacity(0.4),
            ),
            label: '', // Replace with your own label
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              contact,
              height: 40.h,
              width: 40.w,
              color: _currentIndex == 1
                  ? darkBlueColor
                  : greyColor.withOpacity(0.4),
            ),
            label: '', // Replace with your own label
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              add,
              height: 60.h,
              width: 55.w,
              color: darkBlueColor,
            ),
            label: '', // Replace with your own label
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              schedule,
              height: 40.h,
              width: 40.w,
              color: _currentIndex == 3
                  ? darkBlueColor
                  : greyColor.withOpacity(0.4),
            ),
            label: '', // Replace with your own label
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              report,
              height: 40.h,
              width: 40.w,
              color: _currentIndex == 4
                  ? darkBlueColor
                  : greyColor.withOpacity(0.4),
            ),
            label: '', // Replace with your own label
          ),
        ],
      ),
    );
  }
}
