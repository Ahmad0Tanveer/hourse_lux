import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/widgets/styles.dart';

import '../../../widgets/custom_appbar_2.dart';
import '../../../widgets/my_input_shadow.dart';
import '../../../widgets/select_bottom.dart';
import '../add_contacts/add_contact_data.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});
  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  String selectedType = "";
  String selectedTile = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar2(title: 'Add Contact',),
          preferredSize: Size.fromHeight(69),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),
            MyInputShadow(
                title: "Type",
                widget: InkWell(
                  onTap: selectContactType,
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
              width: Get.width,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 16),
              child: Text("Contact Information",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Title",
                widget: InkWell(
                  onTap: selectContactTitle,
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
                title: "First Name",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "Tanveer ",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Last Name",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "Ahmad ",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Primary Phone",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "+44 832938298921",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Email",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "ahmad00tanveer@gmail.com",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
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

  void selectContactTitle(){
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        enableDrag: true,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.32,
            child: SelectBottomSheet(
              onTap: changeTitle,
              title: "Select Title",
              options: AddContactData.contactTitles,
              selectedOption: selectedType,
            ),
          );
        }
    );
  }

  void selectContactType(){
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
              title: "Contact Type",
              options: AddContactData.contactType,
              selectedOption: selectedType,
            ),
          );
        }
    );
  }

  void changeTitle(t){

  }

  void changeType(t){

  }
}
