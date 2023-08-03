import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';

import '../../../core/constant/colors.dart';
import '../../../models/ui/add_home_model.dart';
import '../../../widgets/selected_horses_widget.dart';

class DueDateReportPage extends StatefulWidget {
  const DueDateReportPage({super.key});

  @override
  State<DueDateReportPage> createState() => _DueDateReportPageState();
}

class _DueDateReportPageState extends State<DueDateReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: "due date reports")),
        preferredSize: Size.fromHeight(69),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(left: 16,right: 16),
              child: Text("time frame".toUpperCase(),style: TextStyle(
                color: baseColor,
              ),),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("15 May 1999",style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
            ),
            SizedBox(height: 16),
            SelectedHorseWidget(),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Horse".toUpperCase(),style: TextStyle(
                    color: baseColor,
                  ),),
                  Row(
                    children: [
                      Text("Select All",style: TextStyle(color: baseColor)),
                      Radio(
                          activeColor: baseColor,
                          value: false, groupValue: false, onChanged: (_){}),
                    ],
                  ),
                ],
              ),
            ),
            Wrap(
              children: reportRecordType.map((e) => Container(
                width: Get.width,
                child: Column(

                  children: [
                    SizedBox(height: 12),
                    Row(
                      children: [
                        SizedBox(width: 16),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black,width: 1),
                          ),
                          child:  Image.asset(e.image,width: 39,height: 39,color: Colors.black,),
                        ),
                        SizedBox(width: 6),
                        Text(e.name),
                        Spacer(),
                        Radio(
                            value: false,
                            activeColor: baseColor,
                            groupValue: false, onChanged: (_){}
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(height: 1,color: Color(0xffD7D7D7),),
                  ],
                ),
              )).toList(),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 16,right: 16),
              child: GestureDetector(
                child: Container(
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text("Generate Report",style: Get.theme.textTheme.labelMedium),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
