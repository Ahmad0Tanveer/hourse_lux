import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/widgets/styles.dart';
import '../../../widgets/custom_appbar_2.dart';
import 'report_coggins_page.dart';
import 'report_record_page.dart';
import 'report_select_month_dialog.dart';
import 'select_contact_dialog.dart';
import 'select_horse_dialoge.dart';

class ReportsActivityPage extends StatefulWidget {
  const ReportsActivityPage({super.key});
  @override
  State<ReportsActivityPage> createState() => _ReportsActivityPageState();
}

class _ReportsActivityPageState extends State<ReportsActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: 'Activity',)),
        preferredSize: Size.fromHeight(69),
      ),
      body: ListView(
        children: [
          SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 16,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                color: baseColor,
                width: 130,
                height: 49,
                child: InkWell(
                  onTap: (){
                    Get.dialog(
                        Dialog(
                          backgroundColor: Colors.transparent,
                            child: SelectHorseDialog())
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("All Horses",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),),
                      Icon(Icons.arrow_drop_down,color: Colors.white),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                color: baseColor,
                width: 181,
                height: 49,
                child: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        context: Get.context!,
                        isScrollControlled: true,
                        enableDrag: true,
                        shape: HelperStyles.sheetShape,
                        backgroundColor: baseColor,
                        builder: (context) {
                          return ReportRecordPage();
                        }
                    );
                  },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("All Record types",style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),),
                        Icon(Icons.arrow_drop_down,color: Colors.white),
                      ],
                    ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                color: baseColor,
                width: 150,
                height: 49,
                child: InkWell(
                  onTap: (){
                    Get.dialog(
                      Dialog(
                          backgroundColor: Colors.transparent,
                          child: SelectContactDialog())
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("All Accounts",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),),
                      Icon(Icons.arrow_drop_down,color: Colors.white),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                color: baseColor,
                width: 161,
                height: 49,
                child: InkWell(
                  onTap: (){
                    Get.dialog(
                        Dialog(
                            backgroundColor: Colors.transparent,
                            child: SelectMonthDialog()
                        )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Past Month",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),),
                      Icon(Icons.arrow_drop_down,color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text("Monday, 24, JUNE, 2023",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () => Get.to(() => ReportCoggingsPage()),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 16),
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black,width: 1)
                      ),
                      child: Image.asset("assets/record_type/tube.png",width: 42,height: 42,)),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Coggins Renewal - Harry",style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),),
                      Text("Coggins",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff636363)
                      ),),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_sharp),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(left: 32,right: 32),
            height: 1,color: Color(0xffD7D7D7),),
        ],
      ),
    );
  }
}
