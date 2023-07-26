import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/my_input_shadow.dart';
import '../../../core/constant/colors.dart';
import '../../../widgets/selected_horses_widget.dart';

class AddBodyClipperPage extends StatefulWidget {
  const AddBodyClipperPage({super.key});

  @override
  State<AddBodyClipperPage> createState() => _AddBodyClipperPageState();
}

class _AddBodyClipperPageState extends State<AddBodyClipperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar2(title: "Add Bodyclip"),
          SizedBox(height: 20),
          SelectedHorseWidget(),
          SizedBox(height: 10),
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
                  hintText: "\$ 100",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          SizedBox(height: 10),
          MyInputShadow(
              title: "Quantity",
              widget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "1",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          SizedBox(height: 10),
          MyInputShadow(
              title: "Cost",
              widget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "\$ 100",
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
                child: Text("Add",style: Get.theme.textTheme.labelMedium),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
