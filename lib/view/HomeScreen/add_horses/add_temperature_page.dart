import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/widgets/my_input_shadow.dart';
import 'package:hourse_lux/widgets/selected_horses_widget.dart';

import '../../../widgets/custom_appbar_2.dart';

class AddTemperaturePage extends StatefulWidget {
  const AddTemperaturePage({super.key});
  @override
  State<AddTemperaturePage> createState() => _AddTemperaturePageState();
}

class _AddTemperaturePageState extends State<AddTemperaturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar2(title: "Add Temperature"),
          SelectedHorseWidget(),
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
              title: "Notes",
              widget: TextFormField(
                maxLines: 4,
                minLines: 4,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "Write Notes....",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Text("Attachments",style: Get.textTheme.bodySmall),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Container(
                  width: 160,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 1,color: Color.fromRGBO(23, 34, 34, 1),),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text("Add Attachments"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Display Note",style: Get.textTheme.bodySmall),
                ),
                Switch(value: false, onChanged: (value){})
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16,right: 16),
            child: GestureDetector(
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
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
