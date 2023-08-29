import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/horse_controller.dart';
import 'package:hourse_lux/view/drawer/drawer.dart';
import 'package:hourse_lux/widgets/custom_appbar.dart';

import '../../widgets/HomeScreenListView.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final horse = Get.put(HorseController());
  @override
  Widget build(BuildContext context) {
    Widget searchBar(){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Container(
            color: Color(0xffF4F6F9),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    onChanged: horse.searchHorse,
                    cursorColor: darkBlueColor,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.transparent,
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.search),
              ],
            ),
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: whiteColor,
        drawer: MyDrawer(),
        appBar: PreferredSize(
          child: SafeArea(child: CustomAppBar()),
          preferredSize: Size.fromHeight(62),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 40.h),
            searchBar(),
            SizedBox(height: 20.h),
            HomeScreenListView(),
          ],
        ),
      ),
    );
  }
}
