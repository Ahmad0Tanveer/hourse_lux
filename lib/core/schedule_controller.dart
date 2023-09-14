import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/api_service_controller.dart';
import 'package:hourse_lux/core/helpers/cache_helper.dart';
import 'package:hourse_lux/core/helpers/enums_herlper.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/service_model.dart';

class ScheduleController extends GetxController {
  final api = ApiService();
  final endPoint = "filters";
  List<ServiceModel> services = [];
  List<ServiceModel> backup = [];
  DateTime today = DateTime.now();
  bool state = false;
  var gName = TextEditingController();

  void onDateChange(List dates) async {
    services = [];
    update();
    String month = dates.first.month <= 9 ? "0${dates.first.month}" : "${dates.first.month}";
    String day = dates.first.day <= 9 ? "0${dates.first.day}" : "${dates.first.day}";
    update();
    for (var data in backup) {
      if (data.nextDate.split("T00:00:00.000Z").first == "${dates.first.year}-$month-$day") {
        services.add(data);
      }
    }
    update();
  }

  void init() async {
    services = [];
    backup = [];
    state = true;
    update();
    String month = today.month <= 9 ? "0${today.month}" : "${today.month}";
    String day = today.day <= 9 ? "0${today.day}" : "${today.day}";
    Map<String, String> body = {
      "uid": CacheHelper.userId(),
      "date": "${today.year}-$month-$day"
    };
    var out = await api.request(endPoint: endPoint, body: body, type: RequestType.post);
    state = false;
    update();
    if (out.statusCode == 200) {
      List cs = jsonDecode(out.body);
      for (var s in cs) {
        ServiceModel serviceModel = ServiceModel.fromJson(s);
        backup.add(serviceModel);
      }

      String month = today.month <= 9 ? "0${today.month}" : "${today.month}";
      String day = today.day <= 9 ? "0${today.day}" : "${today.day}";
      for (var data in backup) {
        if (data.nextDate.split("T00:00:00.000Z").first ==
            "${today.year}-$month-$day") {
          services.add(data);
        }
      }
      update();
    } else {
      toast("Some thing went wrong");
    }
    update();
  }
}
