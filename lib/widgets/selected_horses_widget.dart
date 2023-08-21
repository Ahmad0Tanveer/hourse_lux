import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/constant/assets.dart';
import '../core/service_controller.dart';

class SelectedHorseWidget extends StatefulWidget {
  const SelectedHorseWidget({super.key});
  @override
  State<SelectedHorseWidget> createState() => _SelectedHorseWidgetState();
}

class _SelectedHorseWidgetState extends State<SelectedHorseWidget> {
  final service = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: service,
        builder: (_) {
          return Container(
            margin: EdgeInsets.only(left: 16,right: 16,top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Selected Horses".toUpperCase(),style:Get.textTheme.bodyMedium),
                SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: service.selectedHorse!.image,
                    height: 60.h,
                    width: 60.h,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  width: 60.h,
                  alignment: Alignment.center,
                  child: Text("${service.selectedHorse!.neckName}",style:Get.textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                  )),),
                SizedBox(height: 6),
                Container(height: 1,color: Color(0xffD7D7D7),),
              ],
            ),
          );
        }
    );
  }
}
