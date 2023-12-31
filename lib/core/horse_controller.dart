import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/helpers/enums_herlper.dart';
import 'package:hourse_lux/main.dart';
import 'package:hourse_lux/models/contact_model.dart';
import 'package:hourse_lux/models/horse_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import '../view/HomeScreen/horsdetail_page.dart';
import 'api_service_controller.dart';
import '../core/helpers/keys.dart';

class HorseController extends GetxController{
  final service = ApiService();
  final form = GlobalKey<FormState>();
  bool state = false;
  List<HorseModel> horses = [];
  List<HorseModel> backup = [];
  var name = TextEditingController();
  var showName = TextEditingController();
  String ownerName = "";
  String billPair = "";
  var microsChip = TextEditingController();
  var stallName = TextEditingController();
  var stallNot = TextEditingController();
  var paddockName = TextEditingController();
  var paddockLocation = TextEditingController();
  var paddockNote = TextEditingController();
  ContactModel? contactOwner;
  ContactModel? contactBillPayer;
  final picker = ImagePicker();
  final storage = FirebaseStorage.instance;

  File? file;
  late HorseModel details;

  void horesDetailPage(HorseModel horse){
    details = horse;
    update();
    Get.to(() => HorseDetailPage(horse: horse));
  }

  void addHorseData({required bread,required color,required sex}) async {
    if(form.currentState!.validate()){
      if(file != null){
        state = true;
        update();
        var ref = storage.ref("horses/${file!.path.split("/").last}");
        await ref.putFile(file!);
        String url = await ref.getDownloadURL();
        var body = {
          "neckName": name.text,
          "showName": showName.text,
          "owner": contactOwner!.firstName + " " + contactOwner!.lastName,
          "billPayer": contactBillPayer!.firstName + " " + contactBillPayer!.lastName,
          "billPayerId": contactBillPayer!.id,
          "ownerId": contactOwner!.id,
          "img": url,
          "bread": bread,
          "color": color,
          "sex": sex,
          "microchip": microsChip.text,
          "paddockLocation": paddockLocation.text,
          "stallNotes": paddockNote.text.isEmpty?"":paddockNote.text,
        };
        var out = await service.request(endPoint: "addnewhorse-data", body: body, type: RequestType.post);
        state = false;
        update();
        print(out.body);
        if(out.statusCode == 200){
          var h = jsonDecode(out.body)["newaddNewHorse"];
          HorseModel newHorse = HorseModel.fromJson(h);
          horses.add(newHorse);
          backup = horses;
          update();
          form.currentState?.reset();
        } else {
          print(out.body);
        }
        state = false;
        update();
        file = null;
        contactOwner = null;
        contactBillPayer = null;
        update();
      } else {
        state = false;
        update();
        toast("Add Horse Image");
      }
      state = false;
      update();
    }
    state = false;
    update();
  }
  void initHorses() async {
    Map userMap = box.read(allKeys.userMap)??{};
    final String id = userMap["User"]["_id"]??"";
    state = true;
    update();
    if(horses.isEmpty){
      var out = await service.request(endPoint: "addnewhorse-data/$id");
      state = false;
      update();
      if(out.statusCode == 200){
        List data = jsonDecode(out.body)["horses"];
        horses = [];
        for(var h in data){
          horses.add(HorseModel.fromJson(h));
          update();
        }
        backup = horses;
        update();
      } else{}
    } else {}
    state = false;
    update();
  }
  void searchHorse(String text){
    if(text.isNotEmpty){
      horses = [];
      for(var h in backup){
        if(h.showName.toLowerCase().contains(text.toLowerCase())){
          horses.add(h);
          update();
        }
      }
    } else {
      horses = backup;
      update();
    }
  }
  void imagePicker() async {
    var p = await picker.pickImage(source: ImageSource.gallery);
    if(p != null){
      file = File(p.path);
      update();
    }
  }
  void selectHorseOwner(ContactModel contact){
    contactOwner = contact;
    update();
  }
  void selectHorseBillPayer(ContactModel contact){
    contactBillPayer = contact;
    update();
  }
}