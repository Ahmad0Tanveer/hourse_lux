import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/view/HomeScreen/add_contacts/add_contact_dialog.dart';
import 'package:hourse_lux/view/customs/custom_search.dart';
import 'package:hourse_lux/view/customs/custom_text.dart';
import 'add_contacts/add_conatact_page.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> alphabets = ["A", "B", "C", "D"];
    final List<List<String>> nestedList = [
      [
        'Ainhoa York',
        'Avalynn Bruce',
        'Alonso Bravo',
        'Avalynn Bruce',
        'Alonso Bravo',
      ],
      [
        'Brayden Harrington',
        'Braxton Jefferson',
        'Bridget Gonzales',
      ],
      // Add more inner lists here...
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Column(
          children: [
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    color: blackColor,
                  ),
                  SizedBox(width: 20.w),
                  CustomText(
                    text: "CONTACTS",
                    fontSize: 18.sp,
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){

                      Get.dialog(
                          barrierColor: Colors.transparent,
                          Dialog(
                            child: AddContactDialog(),
                          ));
                    },
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(width: 7.w),
                  IconButton(
                    onPressed: () => Get.to(() => AddContactPage()),
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: blackColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            CustomSearchTextField(),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics:
                    ClampingScrollPhysics(), // Disable inner ListView's scrolling
                itemCount: nestedList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            CustomText(
                              text: alphabets[index],
                              fontSize: 18.sp,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 17,
                          right: 17,
                          top: 5,
                          bottom: 15,
                        ),
                        child: Divider(thickness: 1.3),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: nestedList[index].length,
                        itemBuilder: (BuildContext context, int nestedIndex) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 12,
                                      bottom: 15,
                                    ),
                                    child: CustomText(
                                      text: nestedList[index][nestedIndex],
                                      color: blackColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: blackColor,
                                    size: 18.sp,
                                  ),
                                  SizedBox(width: 20)
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 24.h),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
