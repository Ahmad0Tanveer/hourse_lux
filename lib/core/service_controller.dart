import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/api_service_controller.dart';
import 'package:hourse_lux/core/helpers/enums_herlper.dart';
import 'package:hourse_lux/models/contact_model.dart';
import 'package:hourse_lux/widgets/date_picker_dailog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/horse_model.dart';
import '../models/service_model.dart';
import '../view/HomeScreen/bottom_nav_bar.dart';
import 'helpers/service_type_helper.dart';

class ServiceController extends GetxController{
  String endPoint = "services-name";
  HorseModel? selectedHorse;
  ContactModel? adminContact;
  DateTime today = DateTime.now();
  DateTime? nextDate;
  bool state = false;
  late ServiceModel service;
  final picker = ImagePicker();
  var note = TextEditingController();
  var price = TextEditingController();
  var value = TextEditingController();
  final storage = FirebaseStorage.instance;
  File? file;
  final api = ApiService();
  void imagePicker() async {
    var p = await picker.pickImage(source: ImageSource.gallery);
    if(p != null){
      file = File(p.path);
      update();
    }
  }

  void selectHorse(HorseModel h){
    selectedHorse = h;
    update();
  }
  void selectContact(contact) {
    adminContact = contact;
    update();
  }
  void saveServiceData({required String type,required String recordType,Map extra = const {}}) async {
    state = true;
    update();
    if(ServiceTypeHelper.notes == recordType && note.text.isEmpty){
      toast("Enter Some Note");
      return;
    }
    if(recordType == ServiceTypeHelper.temperature && value.text.isEmpty){
      toast("Enter Some Temperature Value");
      return;
    }
    await createServiceModel(type: type, recordType: recordType,extra: extra);
    var out = await api.request(endPoint: endPoint,type: RequestType.post,body: service.toJson());
    state = false;
    update();
    if(out.statusCode == 200){
      toast("Add Successfully",bgColor: Colors.green);
      Get.offAll(() => BottomNavSheetScreen());
    }
  }
  void selectDate(d){
    today = d;
    print(d);
    update();
  }
  void selectNextDate(d){
    nextDate = d;
    update();
  }
  void dateDialogOpen(){
    Get.dialog(Dialog(
      child: MyDatePickerDialog(),
    ));
  }
  void nextDateSelectDialogOpen(){
    Get.dialog(Dialog(
      child: SelectNextDateDialog(),
    ));
  }
  Future createServiceModel({required String type,required String recordType, Map extra = const {}}) async {
    String url = "";
    if(file != null){
      var ref = storage.ref("horses/${file!.path.split("/").last}");
      await ref.putFile(file!);
      url = await ref.getDownloadURL();
    }
    service = ServiceModel(
        horseId: selectedHorse!.sId,
        serviceType: type,
        date: today.toString(),
        nextDate: nextDate.toString(),
        recordType: recordType,
        adminName: adminContact!= null? adminContact!.firstName + " " + adminContact!.lastName : "",
        adminId: adminContact!= null? adminContact!.id:"",
        price: price.text,
        image: url,
        comment: note.text,
        diagName: "",
        diagId: "",
        value: value.text,
        extraData: jsonEncode(extra)
    );
  }
  void clearData(){
    state = false;
    adminContact = null;
    note.clear();
    price.clear();
    today = DateTime.now();
    nextDate = null;
    file = null;
    update();
  }
}
