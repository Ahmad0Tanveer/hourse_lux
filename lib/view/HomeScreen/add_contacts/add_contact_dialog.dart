import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/contact_controller.dart';
import 'add_contact_data.dart';

class AddContactDialog extends StatefulWidget {
  const AddContactDialog({super.key});
  @override
  State<AddContactDialog> createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  final contact = Get.put(ContactController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: baseColor,
      ),
      child: GetBuilder(
          init: contact,
          builder: (_) {
            return Column(
              children: [
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text("Filter Contacts",style: Get.textTheme.labelMedium,)),
                Container(
                  width: Get.width,
                  height: 1,
                  margin: EdgeInsets.only(left: 16,right: 16),
                  color: Colors.grey,
                ),
                SizedBox(height: 20),
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: AddContactData.contactsTypes.map((e){
                    bool active = contact.selectedFilters.contains(e);
                    return GestureDetector(
                      onTap: () => contact.addOrRemoveFromFilter(e),
                      child: Container(
                        height: 30,
                        width: 90,
                        padding: EdgeInsets.only(left: 8,right: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white,width: 1),
                          color: active?Colors.white:null
                        ),
                        child: Text(e,style: Get.textTheme.labelMedium!.copyWith(
                            fontSize: 9,
                            color: active?Colors.black:null,
                        )),
                      ),
                    );
                  }).toList(),
                ),
                Spacer(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color.fromRGBO(238, 187, 68,1),
                              padding: EdgeInsets.only(left: 30,right: 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              )
                          ),
                          onPressed: contact.applyFilter, child: Text("Done",
                          style: Get.textTheme.labelMedium
                      )),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            );
          }
      ),
    );
  }
}
