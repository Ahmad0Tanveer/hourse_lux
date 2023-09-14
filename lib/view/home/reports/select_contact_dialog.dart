import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/activity_controller.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/contact_controller.dart';

import '../../customs/custom_text.dart';

class SelectContactDialog extends StatefulWidget {
  const SelectContactDialog({super.key});
  @override
  State<SelectContactDialog> createState() => _SelectContactDialogState();
}

class _SelectContactDialogState extends State<SelectContactDialog> {
  final contact = Get.put(ContactController());
  final activity   = Get.put(ActivityController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: contact,
      builder: (_) {
        return GetBuilder(
          init: activity,
          builder: (_) {
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
                        InkWell(
                          onTap: activity.selectAllContacts,
                          child: Row(
                            children: [
                              Text("Select All ",style: TextStyle(color: Colors.white)),
                              Container(
                                height: 20,
                                width: 20,
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white,width: 1),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: contact.contacts.length == activity.selectedContactIds.length  ||
                                          activity.selectedContactBool?Colors.white:Colors.transparent
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 16,right: 16,top: 10),
                    child: TextField(
                      onChanged: contact.searchContact,
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
                      itemCount: contact.contacts.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          margin: EdgeInsets.only(left: 16,right: 16),
                          child: InkWell(
                            onTap: (){
                              activity.selectContact(contact.contacts[index].id);
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      text: "${contact.contacts[index].firstName} ${contact.contacts[index].lastName}",
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white,width: 1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: activity.selectedContactBool || activity.selectedContactIds.contains(contact.contacts[index].id)? Colors.white:Colors.transparent
                                        ),
                                      ),
                                    ),
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
                          ),
                        );
                      },
                    ),
                  ),
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
                            onPressed: activity.applyFilters, child: Text("Done",
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
        );
      }
    );
  }
}
