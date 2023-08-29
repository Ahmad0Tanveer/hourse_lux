import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/my_input_shadow.dart';
import 'package:hourse_lux/widgets/select_bottom.dart';
import 'package:hourse_lux/widgets/styles.dart';
import '../../../widgets/selected_horses_widget.dart';
import 'breadings_data.dart';

class AddInseminationPage extends StatefulWidget {
  const AddInseminationPage({super.key});

  @override
  State<AddInseminationPage> createState() => _AddInseminationPageState();
}

class _AddInseminationPageState extends State<AddInseminationPage> {
  String selectedValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar2(title: "Add Insemination"),
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
              title: "Account",
              widget: InkWell(
                onTap: (){},
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select Contact....", style: Get.textTheme.bodyMedium),
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
              title: "Stallion Name",
              widget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "Udder development",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          SizedBox(height: 10),
          MyInputShadow(
              title: "Milk Test pH",
              widget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "pH",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          SizedBox(height: 10),
          MyInputShadow(
              title: "Frequency",
              widget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "Frequency",
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
                  hintText: "Add comments....",
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
  void selectMilkProperties(){
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        enableDrag: true,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: SelectBottomSheet(
              onTap: changeValue,
              title: "Select Insemination Type",
              options: BreadingData.insemination,
              selectedOption: selectedValue,
            ),
          );
        }
    );
  }
  void changeValue(value){
    setState(() {
      selectedValue = value;
    });
    Get.back();
  }
}
