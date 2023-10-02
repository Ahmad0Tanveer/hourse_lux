import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/api_service_controller.dart';
import 'package:hourse_lux/core/helpers/cache_helper.dart';
import 'package:hourse_lux/core/helpers/enums_herlper.dart';
import 'package:hourse_lux/models/supplement_model.dart';
import 'package:nb_utils/nb_utils.dart';

class SupplementController extends GetxController{
  List<SupplementModel> supplements = [];

  var brandName = TextEditingController();
  var drugName = TextEditingController();
  bool state = false;
  final api  = ApiService();
  void addSupplement() async {
    state = true;
    update();
    SupplementModel model = SupplementModel(
      id: "", bName: brandName.text, dName: drugName.text, userId: "");
    var out = await api.request(endPoint: "new-med",body: model.toJson(),type: RequestType.post);
    state = false;
    update();
    if(out.statusCode == 200) {
      Map map = jsonDecode(out.body)["newMed"];
      supplements.add(SupplementModel.fromJson(map as Map<String,dynamic>));
      toast("Add Successfully",bgColor: Colors.green);
      update();
    }
    print(out.body);
  }
  void initSupplements()async {
    state = true;
    update();
    try{
      supplements = [];
      update();
      var out = await api.request(endPoint: "new-med-id/${CacheHelper.userId()}",type: RequestType.get);
      print(out.body);
      List ss = jsonDecode(out.body)["med"];
      for(var map in ss) {
        supplements.add(SupplementModel.fromJson(map as Map<String,dynamic>));
      }
      state = false;
      update();
    }catch(e){
      print(e);
    }
  }
}