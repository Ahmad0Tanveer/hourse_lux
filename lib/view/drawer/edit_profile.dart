import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/main.dart';
import '../../core/constant/colors.dart';
import '../../widgets/custom_appbar_2.dart';
import 'package:hourse_lux/core/helpers/keys.dart';

class EditProfileSection extends StatefulWidget {
  const EditProfileSection({super.key});
  @override
  State<EditProfileSection> createState() => _EditProfileSectionState();
}

class _EditProfileSectionState extends State<EditProfileSection> {
  Map<String,dynamic>  userMap = {};
  @override
  void initState() {
    setState(() {
      Map mp = box.read(allKeys.userMap)??{};
      userMap = mp["User"]??{};
    });
    print(userMap);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget myInputWidget(heading,fieldName){
      return Container(
        margin: EdgeInsets.only(left: 16,right: 16,top: 20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 18),
                Text(heading),
                Text("*",style: TextStyle(color: Colors.red)),
              ],
            ),
            SizedBox(height: 8),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16),
                  fillColor: Color(0xffE4E4E4),
                  filled: true,
                  hintText: fieldName,
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
            child: CustomAppBar2(title: "Edit Profile",)),
        preferredSize: Size.fromHeight(62),
      ),
      body: ListView(
        children: [
          myInputWidget("name",userMap["name"]??""),
          myInputWidget("Email",userMap["email"]??""),
          myInputWidget("Phone No",userMap["phoneNumber"]??""),
          myInputWidget("Current Password",""),
          myInputWidget("New Password",""),
          myInputWidget("Confirm New Password",""),
          Container(height: 20),
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
                child: Text("Save Changes",style: Get.theme.textTheme.labelMedium),
              ),
            ),
          ),
          SizedBox(height: 50),

        ],
      ),
    );
  }
}
