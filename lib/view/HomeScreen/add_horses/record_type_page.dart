import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/models/ui/add_home_model.dart';
import 'herse_select_page.dart';

class RecordTypePage extends StatefulWidget {
  const RecordTypePage({super.key});
  @override
  State<RecordTypePage> createState() => _RecordTypeState();
}

class _RecordTypeState extends State<RecordTypePage> {
  @override
  Widget build(BuildContext context) {
    Widget myTabWidget(image,text){
      return Container(
        width: Get.width/3 - 40,
        height: 90,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white,width: 1),
              ),
              child: Image.asset(image,width: 42,height: 42,),
            ),
            Text(text,style: Get.textTheme.bodySmall!.copyWith(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    return ListView(
      children: [
        SizedBox(height: 20),
        Container(
          width: Get.width,
          height: 4,
          margin: EdgeInsets.only(left: Get.width * 0.46,right: Get.width * 0.46),
          color: Colors.white,
        ),
        Container(
            height: 50,
            alignment: Alignment.center,
            child: Text("Record Type",style: Get.textTheme.labelMedium,)
        ),
        Container(
          width: Get.width,
          height: 1,
          margin: EdgeInsets.only(left: 16,right: 16),
          color: Colors.grey,
        ),
        Container(
            height: 50,
            alignment: Alignment.center,
            child: Text("Choose a health record Type",style: Get.textTheme.labelMedium!.copyWith(
              color: Colors.white,
            ),)
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 16,right: 16),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 8,
            children: [
              GestureDetector(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[0].page,title: "Coggins Renewal",)),
                child: myTabWidget(healthTabs[0].image, healthTabs[0].name),
              ),
              GestureDetector(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[1].page,title: "Add Dental",)),
                child: myTabWidget(healthTabs[1].image, healthTabs[1].name),
              ),
              GestureDetector(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[2].page,title: "Add Deworming",)),
                child: myTabWidget(healthTabs[2].image, healthTabs[2].name),
              ),
              GestureDetector(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[3].page,title: "Add ${healthTabs[3].name}",)),
                child: myTabWidget(healthTabs[3].image, healthTabs[3].name),
              ),
              GestureDetector(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[4].page,title: "Add ${healthTabs[4].name}",)),
                child: myTabWidget(healthTabs[4].image, healthTabs[4].name),
              ),
              GestureDetector(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[5].page,title: "Add ${healthTabs[5].name}",)),
                child: myTabWidget(healthTabs[5].image, healthTabs[5].name),
              ),
              GestureDetector(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[6].page,title: "Add ${healthTabs[6].name}",)),
                child: myTabWidget(healthTabs[6].image, healthTabs[6].name),
              ),
              GestureDetector(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[7].page,title: "Add ${healthTabs[7].name}",)),
                child: myTabWidget(healthTabs[7].image, healthTabs[7].name),
              ),
              InkWell(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[8].page,title: "Add ${healthTabs[8].name}",)),
                child: myTabWidget(healthTabs[8].image, healthTabs[8].name),
              ),
              InkWell(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[9].page,title: "Add Injury",)),
                child: myTabWidget(healthTabs[9].image, healthTabs[9].name),
              ),
              InkWell(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[10].page,title: "Add ${healthTabs[10].name}",)),
                child: myTabWidget(healthTabs[10].image, healthTabs[10].name),
              ),
              InkWell(
                onTap: () => Get.to(() => HorseSelectPage(nextPage: healthTabs[11].page,title: "Add ${healthTabs[11].name}",)),
                child: myTabWidget(healthTabs[11].image, healthTabs[11].name),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
