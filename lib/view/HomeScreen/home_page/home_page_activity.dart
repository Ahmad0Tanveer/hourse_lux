import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/api_service_controller.dart';
import 'package:hourse_lux/core/helpers/enums_herlper.dart';
import 'package:hourse_lux/models/service_model.dart';
import 'package:hourse_lux/widgets/loading_list_shimmer.dart';
import 'package:intl/intl.dart';

import '../../../core/helpers/service_type_helper.dart';
import '../../../core/horse_controller.dart';

class HomePageActivityWidget extends StatefulWidget {
  const HomePageActivityWidget({super.key});
  @override
  State<HomePageActivityWidget> createState() => _HomePageActivityWidgetState();
}

class _HomePageActivityWidgetState extends State<HomePageActivityWidget> {
  final horse = Get.put(HorseController());
  final apiService = ApiService();
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
      return Column(
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
          ):Container(),
          SizedBox(height: show? 20 : 10),
          InkWell(
            onTap: () {},
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 16),
                  Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black,width: 1)
                      ),
                      child: Image.asset(imageHelper(type: model.recordType),width: 33,height: 33,color: Colors.black,)),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.recordType,style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),),
                      Text("${model.recordType} ${model.value}",style: TextStyle(
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
          )
        ],
      );
    }
    Widget showData(data){
      show = true;
      showDate = "";
      List<ServiceModel> all = [];
      if(data.statusCode == 200){
        List cs = jsonDecode(data.body);
        for(var s in cs){
          ServiceModel serviceModel = ServiceModel.fromJson(s);
          all.add(serviceModel);
        }
        all.sort((a, b) => b.date.compareTo(a.date));
      }
      return data.statusCode == 200? Expanded(
        child: ListView(
          shrinkWrap: true,
          children: all.map((e) => showServiceData(e)).toList(),
        ),
      ):Container(
        height: Get.height * 0.5,
        alignment: Alignment.center,
        child: Text("Some Went Wrong"),);
    }
    return FutureBuilder(
        future: apiService.request(endPoint: "services-get/${horse.details.sId}",body: {},type: RequestType.post),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return showData(snapshot.data);
          } else {
            return LoadingListShimmerEffect();
          }
        }
    );
  }
}
