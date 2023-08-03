import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/models/ui/add_home_model.dart';

class ReportRecordPage extends StatefulWidget {
  const ReportRecordPage({super.key});

  @override
  State<ReportRecordPage> createState() => _ReportRecordPageState();
}

class _ReportRecordPageState extends State<ReportRecordPage> {
  @override
  Widget build(BuildContext context) {
    Widget myTabWidget(image,text){
      return Container(
        width: Get.width/3 - 20,
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
            SizedBox(height: 8),
            Text("$text Records",style: Get.textTheme.bodySmall!.copyWith(
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.93,
      child: ListView(
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
              alignment: WrapAlignment.spaceEvenly,
              children: reportRecordType.map((e) => GestureDetector(
                onTap: () {},
                child: myTabWidget(e.image,e.name),
              ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
