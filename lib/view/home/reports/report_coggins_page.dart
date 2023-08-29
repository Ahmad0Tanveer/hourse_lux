import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/widgets/my_input_shadow.dart';

import '../../../widgets/custom_appbar_2.dart';

class ReportCoggingsPage extends StatefulWidget {
  const ReportCoggingsPage({super.key});
  @override
  State<ReportCoggingsPage> createState() => _ReportCoggingsPageState();
}

class _ReportCoggingsPageState extends State<ReportCoggingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: "Coggins")), 
        preferredSize: Size.fromHeight(69),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text("Details",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
          ),
          SizedBox(height: 10),
          MyInputShadow(
              title: "Date",
              widget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "26-June-2023",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          SizedBox(height: 10),
          MyInputShadow(
              title: "Next Due Date",
              widget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "26-OCT-2023",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          SizedBox(height: 10),
          MyInputShadow(
              title: "Comments",
              widget: TextFormField(
                maxLines: 4,
                minLines: 4,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "comments....",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Text("Attachments",style: Get.textTheme.bodySmall),
          ),
          SizedBox(width: 30),
          Row(
            children: [
              SizedBox(width: 18),
              Image.asset("assets/images/horse_head.png"),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
