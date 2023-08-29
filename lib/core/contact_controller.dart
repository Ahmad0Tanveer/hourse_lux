import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/api_service_controller.dart';
import 'package:hourse_lux/core/helpers/enums_herlper.dart';
import 'package:hourse_lux/models/contact_model.dart';
import 'package:nb_utils/nb_utils.dart';

class ContactController extends GetxController{
  String endPoint = "add-contact-data";
  bool state = false;
  final form = GlobalKey<FormState>();
  final service = ApiService();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var phoneNumber = TextEditingController();
  var email = TextEditingController();
  List<ContactModel> contacts = [];
  List<ContactModel> backUp = [];
  List<String> selectedFilters = [];

  void addContact({required type,required title}) async {
    state = true;
    update();
    if(form.currentState!.validate()){
      var body = {
        "contact_type": type,
        "title": title,
        "first_name": firstName.text,
        "last_name": lastName.text,
        "primary_phone": phoneNumber.text,
        "email": email.text
      };
      try{
        var out = await service.request(endPoint: endPoint,type: RequestType.post,body: body);
        contacts.add(ContactModel.fromMap(body));
        contacts.sort((ContactModel a,ContactModel b) => a.fullName.toUpperCase().compareTo(b.fullName.toUpperCase()));
        backUp = contacts;
        state = false;
        update();
        Get.back();
      }catch(e){
        state = false;
        update();
      }
    } else {
      state = false;
      update();
      toast("Some thing went wrong");
    }
  }
  void initContacts() async {
    state = true;
    update();
    if(contacts.isEmpty){
      var out = await service.request(endPoint: endPoint);
      state = false;
      update();
      if(out.statusCode == 200){
        List cs = jsonDecode(out.body)["contacts"];
        contacts = cs.map((e) => ContactModel.fromMap(e)).toList();
        contacts.sort((ContactModel a,ContactModel b) => a.fullName.toUpperCase().compareTo(b.fullName.toUpperCase()));
        backUp = contacts;
        applyFilter(selectMode: true);
        update();
      } else{}
    } else {
      state = false;
      update();
    }
  }
  void searchContact(text){
    contacts = [];
    update();
    if(!text.isEmpty){
      for(var c in backUp){
        if(c.fullName.toLowerCase().contains(text.toLowerCase())){
          contacts.add(c);
          update();
        }
      }
    } else {
      contacts = backUp;
      update();
    }
  }
  void deleteContact() async {

  }
  void addOrRemoveFromFilter(String text){
    if(selectedFilters.contains(text)){
      selectedFilters.remove(text);
    } else {
      selectedFilters.add(text);
    }
    update();
  }
  void setFilters(List<String> filters){
    selectedFilters = filters;
    applyFilter(selectMode: true);
    update();
  }
  void applyFilter({selectMode = false}) async {
    contacts = [];
    for(var c in backUp){
      if(selectedFilters.contains(c.contactType)){
        contacts.add(c);
      }
    }
    if(selectedFilters.isEmpty){
      contacts = backUp;
      update();
    }
    if(!selectMode){
      update();
      Get.back();
    }
  }
}