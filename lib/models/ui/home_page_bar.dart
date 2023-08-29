import 'package:flutter/material.dart';
import 'package:hourse_lux/view/home/home_page/home_page_activity.dart';
import '../../view/home/home_page/home_page_detail_widget.dart';
import '../../view/home/home_page/home_page_reminder_widget.dart';

class DetailTabBar{
  final String title;
  final Widget widget;
  DetailTabBar(this.title, this.widget);
}

List<DetailTabBar> bars = [
  DetailTabBar("Activity", HomePageActivityWidget()),
  DetailTabBar("Reminders",HomePageReminderWidget()),
  DetailTabBar("Details",HomePageDetailWidget()),
];