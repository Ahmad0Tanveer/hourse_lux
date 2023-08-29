import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/service_controller.dart';
import 'package:hourse_lux/models/service_model.dart';
import 'package:hourse_lux/widgets/loading_list_shimmer.dart';
import 'package:intl/intl.dart';
import '../../../core/horse_controller.dart';
import '../../../widgets/activity_service_widget.dart';

class HomePageActivityWidget extends StatefulWidget {
  const HomePageActivityWidget({super.key});
  @override
  State<HomePageActivityWidget> createState() => _HomePageActivityWidgetState();
}

class _HomePageActivityWidgetState extends State<HomePageActivityWidget> {
  final horse = Get.put(HorseController());
  final service = Get.put(ServiceController());
  @override
  void initState() {
    service.horseActivity({horse.details.sId});
    super.initState();
  }
  String showDate = "";
  bool show = true;
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
          ],
        ),
      );
    }

    return GetBuilder(
        init: service,
        builder: (context) {
          if(!service.loadingActivity){
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: service.activities.map((e) => showServiceData(e)).toList(),
            );
          } else {
            return LoadingListShimmerEffect();
          }
        }
    );
  }
}

