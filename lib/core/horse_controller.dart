import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'api_service_controller.dart';

class HorseController extends GetxController{
  final service = ApiService();
  final form = GlobalKey<FormState>();
  
  var name = TextEditingController();
  var showName = TextEditingController();
  var ownerName = TextEditingController();
  var microsChip = TextEditingController();
  var stallName = TextEditingController();
  var stallNot = TextEditingController();
  var paddockName = TextEditingController();
  var paddockLocation = TextEditingController();
  var paddockNote = TextEditingController();
  final picker = ImagePicker();
  File? file;

  void addHorseData({required bread,required color,required sex}) async {
    if(form.currentState!.validate()){

    }
  }
  void imagePicker() async {
    var p = await picker.pickImage(source: ImageSource.gallery);
    if(p != null){
      file = File(p.path);
      update();
    }
  }
}