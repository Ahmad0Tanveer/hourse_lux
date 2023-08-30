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
import 'package:shortuid/shortuid.dart';
import '../models/horse_model.dart';
import '../models/service_model.dart';
import '../view/home/bottom_nav_bar.dart';
import 'helpers/cache_helper.dart';
import 'helpers/service_type_helper.dart';

class ServiceController extends GetxController{
  String endPoint = "services-name";
  HorseModel? selectedHorse;
  ContactModel? adminContact;
  DateTime today = DateTime.now();
  DateTime? nextDate;
  bool state = false;
  bool loadingActivity = false;
  late ServiceModel service;
  final picker = ImagePicker();
  var note = TextEditingController();
  var price = TextEditingController();
  var value = TextEditingController();
  var quantity = TextEditingController(text: "1");
  var cost = "";
  final storage = FirebaseStorage.instance;
  ServiceModel? updateModel;
  List<ServiceModel> activities = [];
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
    if(ServiceTypeHelper.notes == recordType && note.text.isEmpty){
      toast("Enter Some Note",bgColor: Colors.red);
      return;
    }
    if(recordType == ServiceTypeHelper.temperature && value.text.isEmpty){
      toast("Enter Some Temperature Value",bgColor: Colors.red);
      return;
    }
    if(recordType != ServiceTypeHelper.temperature && ServiceTypeHelper.notes != recordType &&  adminContact == null ){
      toast("Please Select Contact",bgColor: Colors.red);
      return;
    }
    state = true;
    update();
    await createServiceModel(type: type, recordType: recordType,extra: extra);
    var out = await api.request(endPoint: endPoint,type: RequestType.post,body: service.toJson());
    state = false;
    update();
    if(out.statusCode == 200){
      toast("Add Successfully",bgColor: Colors.green);
      print(out.body);
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
        id: ShortUid.create(),
        horseId: selectedHorse!.sId,
        serviceType: type,
        userId: CacheHelper.userId(),
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
        cost: cost.isNotEmpty?cost: "",
        quantity: quantity.text.isNotEmpty?quantity.text: "",
        extraData: jsonEncode(extra)
    );
  }
  void horseActivity(id) async {
    print(id);
    activities = [];
    loadingActivity = true;
    update();
   try{
     var out = await api.request(endPoint: "services-get/${id}",body: {},type: RequestType.post);
     loadingActivity = false;
     print(out.body);
     update();
     if(out.statusCode == 200){
       List cs = jsonDecode(out.body);
       for(var s in cs){
         ServiceModel serviceModel = ServiceModel.fromJson(s);
         activities.add(serviceModel);
       }
       activities.sort((a, b) => b.date.compareTo(a.date));
       update();
     }
   }catch(e){
     print(e);
     loadingActivity = false;
     update();
   }
  }
  void initServiceModel(ServiceModel model) async {
    updateModel = model;
    if(model.recordType== ServiceTypeHelper.service){
      setPrice(model.cost);
      quantity.text = model.quantity;
    }
    today =  DateTime.parse(model.date);
    nextDate = DateTime.tryParse(model.nextDate);
    price.text = model.price;
    value.text = model.value;
    note.text = model.comment;
    adminContact = ContactModel(
      id: model.adminId,
      contactType: "",
      title: "",
      firstName: model.adminName.split(" ").first,
      lastName:  model.adminName.split(" ").last,
      primaryPhone: "",
      email: "",
      fullName: model.adminName,
    );
    update();
  }
  void deleteServiceRequest(id) async {
    String point = "filters/$id";
    print(point);
    var out = await api.request(endPoint: point,type: RequestType.delete);
    print(out.body);
    print(id);
    for(var ac in activities){
      if(ac.id == id){
        activities.remove(ac);
        toast("Deleted Successfully",bgColor: Colors.green);
        update();
        Get.back();
      }
    }

  }
  void changeQuantity(value){
    print(value.runtimeType);
    num q = num.parse(value);
    num p = num.parse(price.text);
    cost = (q * p).toStringAsFixed(0);
    if(updateModel!= null){
      updateModel!.cost = cost;
    }
    update();
  }
  void changePrice(value){
    num p = num.parse(value);
    num q = num.parse(quantity.text);
    cost = (q * p).toStringAsFixed(0);
    if(updateModel!= null){
      updateModel!.cost = cost;
    }
    update();
  }
  void setPrice(p){
    price.text = p;
    cost = p;
    update();
  }
  void clearData(){
    state = false;
    adminContact = null;
    note.clear();
    price.clear();
    today = DateTime.now();
    nextDate = null;
    file = null;
  }
}
