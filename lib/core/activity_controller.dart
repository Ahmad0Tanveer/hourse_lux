
import 'dart:convert';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/service_model.dart';
import 'api_service_controller.dart';
import 'helpers/cache_helper.dart';
import 'helpers/enums_herlper.dart';

class ActivityController extends GetxController{
  bool state = false;
  final api = ApiService();
  final endPoint = "filters";

  List<String> selectedHorsesId = [];
  bool selectedHorsesBool = true;
  List<String> selectedContactIds = [];
  bool selectedContactBool = true;
  String recordType = "";

  DateTime? lastDate;
  DateTime? startDate;

  List<ServiceModel> services = [];
  List<ServiceModel> backup = [];

  void init() async {
    services = [];
    backup = [];
    state = true;
    update();
    Map<String, String> body = {
      "uid": CacheHelper.userId(),
      "date": "1999-05-15"
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
      services = backup;
      update();
    } else {
      toast("Some thing went wrong");
    }
    update();
  }
  void selectDate({DateTime? s,DateTime? l}) {
    lastDate = l;
    startDate = s;
    update();
  }
  void selectHorse(String id, {bool mustAdd = false}){
    if(selectedHorsesId.contains(id)){
      selectedHorsesId.remove(id);
      update();
    } else {
      selectedHorsesId.add(id);
      update();
    }
  }
  void selectContact(String id){
    if(selectedContactIds.contains(id)){
      selectedContactIds.remove(id);
    } else {
      selectedContactIds.add(id);
    }
    update();
  }
  void applyFilters() {
    services = [];
    update();
    for(var s in backup){
      bool contactIdMatch = selectedContactBool?true: selectedContactIds.contains(s.adminId);
      bool recordTypeMatch = recordType.isEmpty?true : (s.recordType == recordType);
      bool horseIdMatch = selectedHorsesBool?true: selectedHorsesId.contains(s.horseId);
      print("$contactIdMatch $recordTypeMatch $horseIdMatch");
      if(contactIdMatch && recordTypeMatch && horseIdMatch){
        services.add(s);
        update();
      }
    }
    Get.back();
  }
  void selectAllHorses() {
    selectedHorsesBool = !selectedHorsesBool;
    update();
  }
  void selectAllContacts() {
    selectedContactBool = !selectedContactBool;
    update();
  }
}