import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/supplement_controller.dart';

import '../../../../widgets/custom_appbar_2.dart';
import '../../../../widgets/my_input_shadow.dart';

class AddNewSupplementPage extends StatefulWidget {
  const AddNewSupplementPage({super.key});
  @override
  State<AddNewSupplementPage> createState() => _AddNewSupplementPageState();
}

class _AddNewSupplementPageState extends State<AddNewSupplementPage> {
  final supplement = Get.put(SupplementController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: "New Med/supplements")),
        preferredSize: Size.fromHeight(62),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),
          MyInputShadow(
              title: "Med Name",
              widget: TextFormField(
                controller: supplement.brandName,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "brand name",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          SizedBox(height: 10),
          MyInputShadow(
              title: "Drug Name",
              widget: TextFormField(
                controller: supplement.drugName,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "Name",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          SizedBox(height: 40),
          supplement.state?Container(
            child: AnimatedLoadingSideWaySurge(
              expandWidth: 70,
              borderColor: baseColor,
              speed: Duration(milliseconds: 600),
            ),
          ):Container(
            margin: EdgeInsets.only(left: 16,right: 16),
            child: GestureDetector(
              onTap: supplement.addSupplement,
              child: Container(
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text("Save",style: Get.theme.textTheme.labelMedium),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
