import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/horse_controller.dart';
import 'package:hourse_lux/models/horse_model.dart';
import 'package:hourse_lux/view/customs/custom_text.dart';
import 'package:hourse_lux/widgets/loading_list_shimmer.dart';

class HomeScreenListView extends StatefulWidget {
  const HomeScreenListView({super.key});
  @override
  State<HomeScreenListView> createState() => _HomeScreenListViewState();
}

class _HomeScreenListViewState extends State<HomeScreenListView> {
  final horse = Get.put(HorseController());
  @override
  void initState() {
    horse.initHorses();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget myHorseWidget(HorseModel h){
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
                    Row(
                      children: [
                        CustomText(
                          text: "Sex:",
                          fontSize: 14.sp,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 5),
                        CustomText(
                          text:  h.sex,
                          fontSize: 14.sp,
                          color: greyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () =>  horse.horesDetailPage(h),
                    icon:   Icon(
                      Icons.arrow_forward_ios,
                      color: blackColor,
                    ))
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
    return GetBuilder(
      init: horse,
      builder: (_) {
        return horse.state? LoadingListShimmerEffect() :Container(
          child: Wrap(
            children: horse.horses.map((e) => myHorseWidget(e)).toList(),
          ),
        );
      }
    );
  }
}
