import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/contact_controller.dart';
import 'package:hourse_lux/models/contact_model.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/service_controller.dart';
import '../../customs/custom_text.dart';

class OwnerReportPage extends StatefulWidget {
  const OwnerReportPage({super.key});
  @override
  State<OwnerReportPage> createState() => _OwnerReportPageState();
}

class _OwnerReportPageState extends State<OwnerReportPage> {
  final service = Get.put(ServiceController());
  final contact = Get.put(ContactController());
  ContactModel? contactModel;

  @override
  void initState() {
    for(var c in contact.contacts){
      if(service.selectedHorse!.ownerId == c.id){
        setState(() {
          contactModel = c;
        });
      }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var titleStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: baseColor,
    );
    Widget rowText(n,b){
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Text(n,style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: baseColor,
            ),),
            Text(b,style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Color(0xff636363),
            ),),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: "horse owner reports")),
        preferredSize: Size.fromHeight(69),
      ),
      body: ListView(
        children: [
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(service.selectedHorse!.image),
                ),
                SizedBox(width: 24.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: "${service.selectedHorse!.neckName}",
                          fontSize: 15.sp,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        CustomText(
                          text: "Owner:",
                          fontSize: 14.sp,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          text: contactModel != null? " ${contactModel!.firstName} ${contactModel!.lastName}":"",
                          fontSize: 14.sp,
                          color: greyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            height: 1,color: Color(0xffD7D7D7),),
          SizedBox(height: 12),
          Container(
            margin: EdgeInsets.only(left: 16,right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Text("CONTACT INFO",style: titleStyle),
                SizedBox(height: 16),
                Row(
                  children: [
                   Container(
                     width: Get.width - 100,
                     child: rowText("PRIMARY PHONE: ", contactModel != null? " ${contactModel!.primaryPhone}":""),
                   ),
                    InkWell(
                        onTap: () async {
                          final Uri callLaunchUri = Uri(
                            scheme: 'tel',
                            path: '${contactModel!.primaryPhone}',
                          );
                          if (!await launchUrl(callLaunchUri)) {
                            throw Exception('Could not launch');
                          }
                        },
                        child: Icon(Icons.phone_enabled)),
                    SizedBox(width: 10),
                    InkWell(
                        onTap: () async {
                          final Uri smsLaunchUri = Uri(
                            scheme: 'sms',
                            path: '${contactModel!.primaryPhone}',
                          );
                          if (!await launchUrl(smsLaunchUri)) {
                            throw Exception('Could not launch');
                          }
                        },
                        child: Icon(Icons.message)),
                  ],
                ),
                rowText("EMAIL: ", contactModel != null? " ${contactModel!.email}":""),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
