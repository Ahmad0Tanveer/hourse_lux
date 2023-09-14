import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/activity_controller.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/horse_controller.dart';
import 'package:hourse_lux/view/customs/custom_text.dart';

class SelectHorseDialog extends StatefulWidget {
  const SelectHorseDialog({super.key});
  @override
  State<SelectHorseDialog> createState() => _SelectHorseDialogState();
}

class _SelectHorseDialogState extends State<SelectHorseDialog> {
 final horse = Get.put(HorseController());
 final activity = Get.put(ActivityController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: activity,
      builder: (_) {
        return Container(
          height: 555,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GetBuilder(
            init: horse,
            builder: (_) {
              return Column(
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
                          onTap: activity.selectAllHorses,
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
                                      color: horse.backup.length == activity.selectedHorsesId.length  ||
                                          activity.selectedHorsesBool?Colors.white:Colors.transparent
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
                      onChanged: horse.searchHorse,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16,top: 10),
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search)
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  horsesWidget(),
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
              );
            }
          ),
        );
      }
    );
  }
  Widget horsesWidget(){
    return GetBuilder(
      init: activity,
      builder: (_) {
        return Expanded(
          child: ListView.builder(
            itemCount: horse.horses.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () =>  activity.selectHorse(horse.horses[index].sId),
                title: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: CachedNetworkImage(
                            imageUrl: horse.horses[index].image,
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
                                  text: horse.horses[index].neckName,
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                CustomText(
                                  text: "Owner: ${activity.selectedHorsesBool || activity.selectedHorsesId.contains(horse.horses[index].sId)}",
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomText(
                                  text: horse.horses[index].owner,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                          ],
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
                                color: activity.selectedHorsesBool || activity.selectedHorsesId.contains(horse.horses[index].sId)? Colors.white:Colors.transparent
                            ),
                          ),
                        ),
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
              );
            },
          ),
        );
      }
    );
  }
}
