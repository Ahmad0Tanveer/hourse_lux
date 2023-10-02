import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/activity_controller.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/models/ui/add_home_model.dart';

class ReportRecordPage extends StatefulWidget {
  const ReportRecordPage({super.key});

  @override
  State<ReportRecordPage> createState() => _ReportRecordPageState();
}

class _ReportRecordPageState extends State<ReportRecordPage> {
  final activity = Get.put(ActivityController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget myTabWidget(RecordFiltersType e) {
      return GetBuilder(
          init: activity,
          builder: (_) {
            return InkWell(
              onTap: () => activity.selectRecordType(e),
              child: Container(
                width: width > 350 ? 110 : Get.width / 3 - 20,
                height: 90,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Image.asset(
                            e.image,
                            width: 42,
                            height: 42,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "${e.name}  ${e.hasWordRecord ? "Records" : ""}",
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Positioned(
                        top: 0,
                        right: 20,
                        child: Visibility(
                          visible: activity.selectedRecordType == e,
                          child: Container(
                            height: 22,
                            width: 22,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(Icons.check,color: baseColor,size: 16),
                          ),
                        )
                    )
                  ],
                ),
              ),
            );
          });
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.93,
      child: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            width: Get.width,
            height: 4,
            margin: EdgeInsets.only(
                left: Get.width * 0.46, right: Get.width * 0.46),
            color: Colors.white,
          ),
          Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "Record Type",
                style: Get.textTheme.labelMedium,
              )),
          Container(
            width: Get.width,
            height: 1,
            margin: EdgeInsets.only(left: 16, right: 16),
            color: Colors.grey,
          ),
          Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "Choose a health record Type",
                style: Get.textTheme.labelMedium!.copyWith(
                  color: Colors.white,
                ),
              )),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: reportRecordType
                  .map(
                    (e) => GestureDetector(
                      onTap: () {},
                      child: myTabWidget(e),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
