import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/my_input_shadow.dart';
import 'package:hourse_lux/widgets/select_bottom.dart';
import 'package:hourse_lux/widgets/selected_horses_widget.dart';
import 'package:hourse_lux/widgets/styles.dart';

import 'add_horse_data.dart';

class AddVaccinationPage extends StatefulWidget {
  const AddVaccinationPage({super.key});
  @override
  State<AddVaccinationPage> createState() => _AddVaccinationPageState();
}

class _AddVaccinationPageState extends State<AddVaccinationPage> {
  String selectedType = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar2(title: "Add Vaccination"),
          SizedBox(height: 10),
          SelectedHorseWidget(),
          SizedBox(height: 10),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text("Add Details",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
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
              title: "Type",
              widget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "Select.....",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          MyInputShadow(
              title: "Type",
              widget: InkWell(
                onTap: selectType,
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select.....", style: Get.textTheme.bodyMedium),
                      Icon(Icons.arrow_drop_down_outlined),
                    ],
                  ),
                ),
              )
          ),
          SizedBox(height: 10),
          MyInputShadow(
              title: "Administrated By",
              widget: InkWell(
                onTap: (){},
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select Contact", style: Get.textTheme.bodyMedium),
                      Icon(Icons.arrow_drop_down_outlined),
                    ],
                  ),
                ),
              )
          ),
          SizedBox(height: 10),
          MyInputShadow(
              title: "Price",
              widget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "\$ Price",
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
          SizedBox(height: 10),
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
                child: Text("Add",style: Get.theme.textTheme.labelMedium),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
  void selectType() {
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        enableDrag: true,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: SelectBottomSheet(
              onTap: changeType,
              title: "Select Vaccination Record",
              options: AddHorseData.vaccinationsType,
              selectedOption: selectedType,
            ),
          );
        }
    );
  }
  void changeType(text){
    selectedType = text;
    Get.back();
  }
}
