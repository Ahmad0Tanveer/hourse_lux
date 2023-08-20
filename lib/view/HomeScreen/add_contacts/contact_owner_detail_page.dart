import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import '../../../widgets/my_input_shadow.dart';

class ContactOwnerGroupDetailPage extends StatefulWidget {
  const ContactOwnerGroupDetailPage({super.key});
  @override
  State<ContactOwnerGroupDetailPage> createState() => _ContactOwnerGroupDetailPageState();
}

class _ContactOwnerGroupDetailPageState extends State<ContactOwnerGroupDetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget groutOwner(name,share){
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
                  child: Text("Owner",style: Get.textTheme.bodySmall!.copyWith(
                    color: Color(0xff2C3A4B),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(height: 10),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: name,
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Percentage",style: Get.textTheme.bodySmall!.copyWith(
                    color: Color(0xff2C3A4B),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                SizedBox(height: 10),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: share,
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
              ],
            ),
          )
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
            child: CustomAppBar2(title: " Owner Group Details",)
        ),
        preferredSize: Size.fromHeight(62),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Container(
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
                  hintText: "Group 1",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          SizedBox(height: 10),

          groutOwner("Tanveer", "50%"),
          groutOwner("Ahmad", "50%"),

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
          SizedBox(height: 10),
          MyInputShadow(
              title: "USEF Number",
              widget: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  hintText: "usef number",
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
                  hintText: "Comments",
                  hintStyle: Get.textTheme.bodyMedium,
                  filled: true,
                ),
              )
          ),
          SizedBox(height: 16),
          Container(
            width: Get.width,
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
}
