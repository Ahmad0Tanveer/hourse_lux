import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';

import '../../../widgets/custom_appbar_2.dart';
import '../../../widgets/my_input_shadow.dart';

class AddContactUpload extends StatefulWidget {
  const AddContactUpload({super.key});
  @override
  State<AddContactUpload> createState() => _AddContactUploadState();
}

class _AddContactUploadState extends State<AddContactUpload> {
  bool lease = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar2(title: 'Add Contact Upload',),
          preferredSize: Size.fromHeight(69),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),
            MyInputShadow(
                title: "Type",
                widget: InkWell(
                  onTap: (){},
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
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.only(left: 16),
                child: Text("Document Type", style: Get.textTheme.bodyMedium)
            ),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                        groupValue: true,
                        value: lease,
                        activeColor: baseColor,
                        onChanged: (_){
                          setState(() {
                            lease = true;
                          });
                        }),
                    Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text("Liability Release", style: Get.textTheme.bodyMedium)
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        groupValue: true,
                        value: !lease,
                        activeColor: baseColor,
                        onChanged: (_){
                          setState(() {
                            lease = false;
                          });
                        }),
                    Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text("Other Document", style: Get.textTheme.bodyMedium)
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            Container(
                margin: EdgeInsets.only(left: 16),
                child: Text("Liability Release", style: Get.textTheme.bodyMedium)
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 1,color: Color.fromRGBO(23, 34, 34, 1),),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("Add Liability Release "),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Visibility(
                visible: !lease,
                child: othersWidget()),
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
          ],
        ),
      ),
    );
  }
  Widget othersWidget(){
    return Column(
      children: [
        SizedBox(height: 20),
        MyInputShadow(
            title: "Title",
            widget: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.transparent,
                hintText: "title",
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
        SizedBox(height: 16),
      ],
    );
  }
}
