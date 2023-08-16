import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/view/drawer/drawer.dart';
import 'package:hourse_lux/widgets/HomeScreenListView.dart';
import 'package:hourse_lux/widgets/custom_appbar.dart';
import 'package:hourse_lux/view/customs/custom_search.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
        key: scaffoldKey,
        backgroundColor: whiteColor,
        drawer: MyDrawer(),
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
