import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/colors.dart';
import '../../widgets/custom_appbar_2.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});
  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
            child: CustomAppBar2(title: "Contact us",)),
        preferredSize: Size.fromHeight(62),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Container(
              margin: EdgeInsets.all(16),
              child: Text("Write a message"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16,right: 16),
            child: TextField(
              maxLines: 8,
              minLines: 8,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16),
                fillColor: Color(0xffE4E4E4),
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
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
                child: Text("Send",style: Get.theme.textTheme.labelMedium),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
