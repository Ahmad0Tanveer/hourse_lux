import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';

import '../../customs/custom_text.dart';

class SelectContactDialog extends StatefulWidget {
  const SelectContactDialog({super.key});
  @override
  State<SelectContactDialog> createState() => _SelectContactDialogState();
}

class _SelectContactDialogState extends State<SelectContactDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 555,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Select Horse".toUpperCase(),style: TextStyle(
                  color: Colors.white,
                ),),
                Row(
                  children: [
                    Text("Select All",style: TextStyle(color: Colors.white)),
                    Radio(
                        activeColor: Colors.white,
                        value: false, groupValue: false, onChanged: (_){}),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 45,
            margin: EdgeInsets.only(left: 16,right: 16,top: 10),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 16,top: 10),
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search)
              ),
            ),
          ),
          SizedBox(height: 26),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: " Avalynn Bruce",
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          Spacer(),
                          Radio(
                              activeColor: Colors.white,
                              value: true, groupValue: true, onChanged: (_){}),
                        ],
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Divider(
                          thickness: 1.5,
                          color: greyColor.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Spacer(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(238, 187, 68,1),
                        padding: EdgeInsets.only(left: 20,right: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        )
                    ),
                    onPressed: (){}, child: Text("Done",
                    style: Get.textTheme.labelMedium!.copyWith(fontSize: 19)
                )),
                SizedBox(width: 15),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
