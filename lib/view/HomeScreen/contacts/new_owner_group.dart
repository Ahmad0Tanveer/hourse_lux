import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';
import '../../../widgets/custom_appbar_2.dart';
import '../../../widgets/my_input_shadow.dart';

class NewOwnerGroup extends StatefulWidget {
  const NewOwnerGroup({super.key});
  @override
  State<NewOwnerGroup> createState() => _NewOwnerGroupState();
}

class _NewOwnerGroupState extends State<NewOwnerGroup> {
  @override
  Widget build(BuildContext context) {
    Widget groutOwner(){
      return Card(
          elevation: 10,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Color(0xffD9D9D9),width: 1)
          ),
          child: Container(
            padding: EdgeInsets.only(top: 16,bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Owner",style: Get.textTheme.bodySmall),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "Select....",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Percentage",style: Get.textTheme.bodySmall),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "0 % ",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
              ],
            ),
          )
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar2(title: 'New Owner Group',),
          preferredSize: Size.fromHeight(69),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),
            Container(
              width: Get.width,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 16),
              child: Text("GROUP INFO AND MEMBERS",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Group Name",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "name ",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 10),
            groutOwner(),

            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 16),
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
                        Text("Add Group Member "),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            MyInputShadow(
                title: "USEF Number",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "usef number ",
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
            Container(
              width: Get.width,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 16),
              child: Text("GROUP INFO AND MEMBERS",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
            ),
            SizedBox(height: 26),
            Container(
              margin: EdgeInsets.only(left: 16,right: 16),
              child: Row(
                children: [
                  Column(
                    children: [
                      Image.asset("assets/images/h1.png",height: 39,width: 39),
                      SizedBox(height: 3),
                      Text("Foris")
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Image.asset("assets/images/h1.png",height: 39,width: 39),
                      SizedBox(height: 3),
                      Text("Hary")
                    ],
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Container(
                        height: 39,
                        width: 39,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add),
                      ),
                      SizedBox(height: 3),
                      Text("Foris")
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 26),
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
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
