import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';

import '../../../widgets/custom_appbar_2.dart';
import '../../../widgets/my_input_shadow.dart';
import '../../../widgets/selected_horses_widget.dart';
class CogginsRenewalPage extends StatelessWidget {
  const CogginsRenewalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar2(title: 'Add Coggins ',),
          preferredSize: Size.fromHeight(69),
        ),
        body: ListView(
          children: [
            SelectedHorseWidget(),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text("Add Details",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 16),
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
            Container(
              margin: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
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
            SizedBox(height: 30),
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
      ),
    );
  }
}
