import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/view/HomeScreen/HomeScreenListView.dart';
import 'package:hourse_lux/view/HomeScreen/custom_appbar.dart';
import 'package:hourse_lux/view/customs/custom_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 40.h),
            CustomSearchTextField(),
            SizedBox(height: 20.h),
            HomeScreenListView(),
          ],
        ),
      ),
    );
  }
}
