import 'package:flutter/material.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/view/home/contact_screen.dart';
import 'package:hourse_lux/view/home/home_screen.dart';
import 'package:hourse_lux/view/home/report_screen.dart';
import 'package:hourse_lux/view/home/schedule_screen.dart';

import '../../view/home/add_horse_page.dart';

class MyBottomBar{
  final String label;
  final String image;
  final Widget page;
  MyBottomBar({required this.label,required this.image,required this.page});
}
List<MyBottomBar> allBars = [
  MyBottomBar(image: horse,label: "",page: HomeScreen()),
  MyBottomBar(image: contact,label: "",page: ContactScreen()),
  MyBottomBar(image: add,label: "",page: AddHorsePage()),
  MyBottomBar(image: schedule,label: "",page: ScheduleScreen()),
  MyBottomBar(image: report,label: "",page: ReportScreen()),
];

