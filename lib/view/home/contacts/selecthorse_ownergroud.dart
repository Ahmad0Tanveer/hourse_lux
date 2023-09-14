import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/contact_controller.dart';
import 'package:hourse_lux/models/horse_model.dart';

import '../../../core/horse_controller.dart';
import '../../../core/service_controller.dart';
import '../../../widgets/custom_appbar_2.dart';
import '../../customs/custom_text.dart';

class SelectHorseForOwnerGroup extends StatefulWidget {
  const SelectHorseForOwnerGroup({super.key});
  @override
  State<SelectHorseForOwnerGroup> createState() => _SelectHorseForOwnerGroupState();
}

class _SelectHorseForOwnerGroupState extends State<SelectHorseForOwnerGroup> {
  final service = Get.put(ServiceController());
  final horse = Get.put(HorseController());
  final contact = Get.put(ContactController());

  @override
  void initState() {
    horse.initHorses();
    super.initState();
  }
  @override
  void dispose() {
    horse.searchHorse("");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Widget myHorseWidget(HorseModel h){
      return GetBuilder(
        init: contact,
        builder: (_) {
          return ListTile(
            title: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                        imageUrl: h.image,
                        height: 60.h,
                        width: 60.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: h.neckName,
                              fontSize: 15.sp,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            CustomText(
                              text: "Owner:",
                              fontSize: 14.sp,
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(width: 5),
                            CustomText(
                              text:  h.owner,
                              fontSize: 14.sp,
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () =>  contact.selectHorseByID(h.sId),
                      icon:   Container(
                        height: 20,
                        width: 20,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          border: Border.all(color: baseColor,width: 1),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: service.selectedHorse == contact.selectedHorseId?baseColor:Colors.transparent
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(
                    thickness: 1,
                    color: greyColor.withOpacity(0.5),
                  ),
                )
              ],
            ),
            // Add more customization or widgets as needed for each item
          );
        }
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: "Owner Ship")),
        preferredSize: Size.fromHeight(63),
      ),
      body: GetBuilder(
          init: service,
          builder: (_) {
            return Stack(
              children: [
                GetBuilder(
                    init: horse,
                    builder: (_) {
                      return Container(
                        height: Get.height,
                        child: ListView(
                          shrinkWrap: true,
                          children: [

                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(left: 10,right: 10),
                              height: 50,
                              child: TextField(
                                onChanged: horse.searchHorse,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Color.fromRGBO(223, 226, 232,1),
                                  filled: true,
                                  hintText: "Search",
                                  suffixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Wrap(
                              children: horse.horses.map((e) =>  myHorseWidget(e)).toList(),
                            ),
                          ],
                        ),
                      );
                    }
                ),

              ],
            );
          }
      ),
    );
  }
}
