import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/helpers/enums_herlper.dart';
import 'package:hourse_lux/models/contact_model.dart';
import 'package:hourse_lux/models/horse_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../view/home/bottom_nav_bar.dart';
import '../view/home/horsdetail_page.dart';
import 'api_service_controller.dart';
import 'helpers/cache_helper.dart';

class HorseController extends GetxController {
  final service = ApiService();
  final form = GlobalKey<FormState>();
  bool state = false;
  List<HorseModel> horses = [];
  List<HorseModel> backup = [];
  String horseImage = "";
  var name = TextEditingController();
  var showName = TextEditingController();
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
  String editHorseId = "";

  void horesDetailPage(HorseModel horse) {
    details = horse;
    update();
    Get.to(() => HorseDetailPage(horse: horse));
  }

  void initHorseEdit() {
    print(details.neckName);
  }

  void addHorseData({required bread, required color, required sex, bool edit = false}) async {
    if (form.currentState!.validate()) {
      if (file != null || edit) {
        state = true;
        update();
        if(file != null){
          var ref = storage.ref("horses/${file!.path.split("/").last}");
          await ref.putFile(file!);
          horseImage = await ref.getDownloadURL();
        }
        var body = {
          "neckName": name.text,
          "showName": showName.text,
          "owner": contactOwner!.firstName + " " + contactOwner!.lastName,
          "billPayer": contactBillPayer!.firstName + " " + contactBillPayer!.lastName,
          "billPayerId": contactBillPayer!.id,
          "ownerId": contactOwner!.id,
          "img": horseImage,
          "bread": bread,
          "color": color,
          "sex": sex,
          "microchip": microsChip.text,
          "paddockLocation": paddockLocation.text,
          "stallNotes": stallNot.text.isEmpty ? "" : stallNot.text,
          "paddockName": paddockName.text,
          "stallNumber": stallName.text,
        };
        var out;
        if(!edit){
          out = await service.request(endPoint: "addnewhorse-data", body: body, type: RequestType.post);
        } else {
          out = await service.request(endPoint: "addnewhorse-data/$editHorseId", body: body, type: RequestType.put);
        }
        state = false;
        update();
        if (out.statusCode == 200) {
          if(edit){
             for(var b in backup){
               if(b.sId == editHorseId){
                 var h = jsonDecode(out.body);
                 print(h);
               }
             }
          }else{
            var h = jsonDecode(out.body)["newaddNewHorse"];
            HorseModel newHorse = HorseModel.fromJson(h);
            horses.add(newHorse);
            backup = horses;
            update();
          }
        } else {}
        state = false;
        update();
        file = null;
        contactOwner = null;
        contactBillPayer = null;
        update();
        Get.offAll(() => BottomNavSheetScreen());
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

  void deleteHorse(id) async {
    PanaraConfirmDialog.show(
      Get.context!,
      title: "${details.neckName}",
      message: "Are sure you want to delete ${details.neckName}",
      confirmButtonText: "Confirm",
      cancelButtonText: "Cancel",
      color: baseColor,
      buttonTextColor: baseColor,
      textColor: baseColor,
      onTapCancel: () => Get.back(),
      onTapConfirm: () async {
        ProgressDialog pd = ProgressDialog(context: Get.context);
        pd.show(msg: 'deleting ${details.neckName}');
        await service.request(endPoint: 'addnewhorse-data/$id', type: RequestType.delete);
        backup.removeWhere((horse) => horse.sId == id);
        horses.removeWhere((horse) => horse.sId == id);
        update();
        pd.close();
        Get.back();
        Get.back();
      },
      panaraDialogType: PanaraDialogType.normal,
      barrierDismissible: false, // optional parameter (default is true)
    );
  }

  void initHorses() async {
    state = true;
    update();
    if (horses.isEmpty) {
      var out = await service.request(
          endPoint: "addnewhorse-data/${CacheHelper.userId()}");
      state = false;
      update();
      if (out.statusCode == 200) {
        List data = jsonDecode(out.body)["horses"];
        horses = [];
        for (var h in data) {
          horses.add(HorseModel.fromJson(h));
          update();
        }
        backup = horses;
        update();
      } else {}
    } else {}
    state = false;
    update();
  }

  void searchHorse(String text) {
    print(text);
    if (text.isNotEmpty) {
      horses = [];
      update();
      for (var h in backup) {
        if (h.neckName.toLowerCase().contains(text.toLowerCase())) {
          horses.add(h);
          update();
        } else {}
      }
    } else {
      horses = backup;
      update();
    }
  }

  void initEdit(HorseModel h) {
    contactBillPayer = ContactModel(
        id: h.billPayerId,
        contactType: "",
        title: "",
        firstName: h.billPayer,
        lastName: "",
        primaryPhone: "",
        email: "",
        fullName: "");
    contactOwner = ContactModel(
        id: h.ownerId,
        contactType: "",
        title: "",
        firstName: h.owner,
        lastName: "",
        primaryPhone: "",
        email: "",
        fullName: "");
    ;
    horseImage = h.image;
    name = TextEditingController(text: h.neckName);
    showName = TextEditingController(text: h.showName);
    microsChip = TextEditingController(text: h.microchip);
    stallName = TextEditingController(text: "");
    stallNot = TextEditingController(text: h.stallNumber);
    paddockName = TextEditingController(text: h.paddockName);
    paddockLocation = TextEditingController(text: h.paddockLocation);
    paddockNote = TextEditingController(text: h.paddockName);
  }

  void clearData() {
    contactBillPayer = null;
    contactOwner = null;
    name = TextEditingController();
    showName = TextEditingController();
    microsChip = TextEditingController();
    stallName = TextEditingController();
    stallNot = TextEditingController();
    paddockName = TextEditingController();
    paddockLocation = TextEditingController();
    paddockNote = TextEditingController();
    update();
  }

  void imagePicker() async {
    var p = await picker.pickImage(source: ImageSource.gallery);
    if (p != null) {
      file = File(p.path);
      update();
    }
  }

  void selectHorseOwner(ContactModel contact) {
    contactOwner = contact;
    update();
  }

  void selectHorseBillPayer(ContactModel contact) {
    contactBillPayer = contact;
    update();
  }
}
