import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/activity_controller.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/widgets/loading_list_shimmer.dart';
import 'package:hourse_lux/widgets/styles.dart';
import 'package:intl/intl.dart';
import '../../../models/service_model.dart';
import '../../../widgets/activity_service_widget.dart';
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
  final activity = Get.put(ActivityController());
  String showDate = "";
  bool show = true;
  @override
  void initState() {
    activity.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget showServiceData(ServiceModel model){
      var date = DateTime.parse(model.date);
      var parseDara = DateFormat.yMMMMEEEEd().format(date);
      if(showDate.isEmpty){
        showDate = DateFormat.yMMMMEEEEd().format(date);
      } else if(parseDara != showDate){
        showDate = DateFormat.yMMMMEEEEd().format(date);
      } else {
        show = false;
      }
      return Container(
        child: Column(
          children: [
            SizedBox(height: 16),
            show?  Container(
              width: Get.width,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16),
              child: Text("${showDate}",style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),),
            ):SizedBox(),
            SizedBox(height: 10),
            ActivityServiceWidget(model: model),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 16,right: 16),
                height: 1,color: Color(0xffD7D7D7)),
            SizedBox(height: 10),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: 'Activity',)),
        preferredSize: Size.fromHeight(69),
      ),
      body: GetBuilder(
        init: activity,
        builder: (_) {
          return ListView(
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
              SizedBox(height: 16),
              activity.state?LoadingListShimmerEffect():
                  Wrap(children: activity.services.map((e) => showServiceData(e)).toList()),
            ],
          );
        }
      ),
    );
  }
}
