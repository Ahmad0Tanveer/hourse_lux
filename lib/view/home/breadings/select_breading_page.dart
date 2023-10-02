import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/view/home/add_horses/herse_select_page.dart';
import 'package:hourse_lux/view/home/breadings/add_insemination_page.dart';
import 'package:hourse_lux/view/home/breadings/add_mil_test_page.dart';
import 'package:hourse_lux/view/home/breadings/add_ovulation_page.dart';
import 'package:hourse_lux/view/home/breadings/add_pregnancy_check_page.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'add_semen_collection_page.dart';
import 'breadings_data.dart';
import 'foaling_breading_rocords.dart';

class SelectBreadingTypePage extends StatelessWidget {
  const SelectBreadingTypePage({super.key});
  @override
  Widget build(BuildContext context) {
    Widget breadWidget(title){
      return Container(
        margin: EdgeInsets.only(left: 16,right: 16),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Icon(Icons.arrow_forward_ios_rounded,size: 20),
              ],
            ),
            SizedBox(height: 17),
            Container(height: 2,color: Colors.grey,)
          ],
        ),
      );
    }
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar2(title: "Choose Record Type"),
          SizedBox(height: 20),
          Container(
            width: Get.width,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16),
            child: Text("Selected Type Of Event",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w700)),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () => Get.to(HorseSelectPage(nextPage: AddMilTextPage(), title: "Add ${BreadingData.types[0]}")),
            child: breadWidget(BreadingData.types[0]),
          ),
          InkWell(
            onTap: () => Get.to(HorseSelectPage(nextPage: FoalingBreadRecord(), title: "Add ${BreadingData.types[1]}")),
            child: breadWidget(BreadingData.types[1]),
          ),
          InkWell(
            onTap: () => Get.to(HorseSelectPage(nextPage: AddInseminationPage(), title: "Add ${BreadingData.types[2]}")),
            child: breadWidget(BreadingData.types[2]),
          ),
          InkWell(
            onTap: () => Get.to(HorseSelectPage(nextPage: AddOvulationPage(), title: "Add ${BreadingData.types[3]}")),
            child: breadWidget(BreadingData.types[3]),
          ),
          InkWell(
            onTap: () => Get.to(HorseSelectPage(nextPage: AddPregnancyCheck(), title: "Add ${BreadingData.types[4]}")),
            child: breadWidget(BreadingData.types[4]),
          ),
          InkWell(
            onTap: () => Get.to(HorseSelectPage(nextPage: AddSemenCollectionPage(), title: "Add ${BreadingData.types[5]}")),
            child: breadWidget(BreadingData.types[5]),
          ),
        ],
      ),
    );
  }
}
