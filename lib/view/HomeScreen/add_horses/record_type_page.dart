import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/models/ui/add_home_model.dart';

class RecordTypePage extends StatefulWidget {
  const RecordTypePage({super.key});
  @override
  State<RecordTypePage> createState() => _RecordTypeState();
}

class _RecordTypeState extends State<RecordTypePage> {
  @override
  Widget build(BuildContext context) {
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
            children: healthTabs.map((e) => GestureDetector(
              onTap: () => Get.to(() => e.page),
              child: Container(
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
                      child: Image.asset(e.image,width: 42,height: 42,),
                    ),
                    Text(e.name,style: Get.textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    )),
                  ],
                ),
              ),
            )).toList(),
          ),
        ),
      ],
    );
  }
}
