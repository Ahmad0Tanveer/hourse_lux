import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/api_service_controller.dart';
import 'package:hourse_lux/core/helpers/cache_helper.dart';
import 'package:hourse_lux/core/helpers/enums_herlper.dart';
import 'package:hourse_lux/models/contact_model.dart';
import 'package:hourse_lux/models/ownergroup_model.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shortuid/shortuid.dart';

class ContactController extends GetxController {
  String endPoint = "add-contact-data";
  final String ownerEndPoint = "groups";
  bool state = false;
  final form = GlobalKey<FormState>();
  final service = ApiService();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var phoneNumber = TextEditingController();
  var email = TextEditingController();
  var oName = TextEditingController();
  var oNumber = TextEditingController();
  var oComment = TextEditingController();
  List<OwnerGroup> groups = [];
  String selectedHorseId = "";
  Map<String, String> sharesName = {};
  Map<String, String> shares = {"": ""};
  List<ContactModel> contacts = [];
  List<ContactModel> backUp = [];
  List<String> selectedFilters = [];

  void selectHorseByID(id) {
    selectedHorseId = id;
    print(selectedHorseId);
    update();
    Get.back();
  }

  void addContact({required type, required title}) async {
    state = true;
    update();
    if (form.currentState!.validate()) {
      var body = {
        "contact_type": type,
        "title": title,
        "first_name": firstName.text,
        "last_name": lastName.text,
        "primary_phone": phoneNumber.text,
        "email": email.text
      };
      try {
        await service.request(
            endPoint: endPoint, type: RequestType.post, body: body);
        contacts.add(ContactModel.fromMap(body));
        contacts.sort((ContactModel a, ContactModel b) =>
            a.fullName.toUpperCase().compareTo(b.fullName.toUpperCase()));
        backUp = contacts;
        state = false;
        update();
        Get.back();
      } catch (e) {
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
    if (contacts.isEmpty) {
      var out = await service.request(
          endPoint: "add-contact-data-by-id/${CacheHelper.userId()}");
      state = false;
      update();
      if (out.statusCode == 200) {
        List cs = jsonDecode(out.body)["contact"];
        contacts = cs.map((e) => ContactModel.fromMap(e)).toList();
        contacts.sort((ContactModel a, ContactModel b) =>
            a.fullName.toUpperCase().compareTo(b.fullName.toUpperCase()));
        backUp = contacts;
        for (var c in contacts) {
          sharesName[c.id] = c.firstName + " " + c.lastName;
        }
        applyFilter(selectMode: true);
        update();
      } else {}
    } else {
      state = false;
      update();
    }
  }

  void addOwnerGroup() async {
    state = true;
    update();
    try {
      OwnerGroup model = OwnerGroup(
        id: ShortUid.create(),
        name: oName.text,
        number: oNumber.text,
        comment: oComment.text,
        horseId: selectedHorseId,
        userId: CacheHelper.userId(),
        shares: jsonEncode(shares),
      );
      await service.request(
          endPoint: ownerEndPoint,
          type: RequestType.post,
          body: model.toJson());
      groups.add(model);
      state = false;
      update();
      Get.back();
    } catch (e) {
      state = false;
      update();
    }
  }

  void onChangeShare(key, value) {
    num sum = 0;
    shares[key] = value;
    update();
    for (var s in shares.values) {
      sum += num.tryParse(s) ?? 0.0;
    }
    if (sum > 100) {
      toast(
        "Some of Share Not be Greater than 100",
        bgColor: redColor,
      );
      return;
    }
  }

  void searchContact(text) {
    contacts = [];
    update();
    if (!text.isEmpty) {
      for (var c in backUp) {
        if (c.fullName.toLowerCase().contains(text.toLowerCase())) {
          contacts.add(c);
          update();
        }
      }
    } else {
      contacts = backUp;
      update();
    }
  }

  void deleteContact() async {}

  void addOrRemoveFromFilter(String text) {
    if (selectedFilters.contains(text)) {
      selectedFilters.remove(text);
    } else {
      selectedFilters.add(text);
    }
    update();
  }

  void setFilters(List<String> filters) {
    selectedFilters = filters;
    applyFilter(selectMode: true);
    update();
  }

  void applyFilter({selectMode = false}) async {
    contacts = [];
    for (var c in backUp) {
      if (selectedFilters.contains(c.contactType)) {
        contacts.add(c);
      }
    }
    if (selectedFilters.isEmpty) {
      contacts = backUp;
      update();
    }
    if (!selectMode) {
      update();
      Get.back();
    }
  }

  void addMember() {
    shares[""] = "";
    update();
  }

  void selectContact(ContactModel c) {
    shares.remove("id");
    shares["${c.id}"] = "";
    update();
  }
  void updateContactId(String id,{required type, required title}) async {
    state = true;
    update();
    Map<String,String> body = {
      "contact_type": type,
      "title": title,
      "first_name": firstName.text,
      "last_name": lastName.text,
      "primary_phone": phoneNumber.text,
      "email": email.text
    };
    try{
      var out = await service.request(endPoint: "update/$id",body: body,type: RequestType.put);
      state = false;
      update();
      if (out.statusCode == 200) {
        toast("Updated Successfully", bgColor: redColor);
      } else {
        toast(
          "Failed Updated",
          bgColor: redColor,
        );
      }
    }catch(e) {
      state = false;
      toast(
        "Failed Updated",
        bgColor: redColor,
      );
      update();
    }
  }
  void initOwnerGroups() async {
    state = true;
    update();
    try {
      print("$ownerEndPoint/${CacheHelper.userId()}");
      var out = await service.request(endPoint: "$ownerEndPoint/${CacheHelper.userId()}");
      log(out.body);
      state = false;
      update();
      if (out.statusCode == 200) {
        groups = [];
        List data = jsonDecode(out.body)["results"];
        for(var d in data){
          groups.add(OwnerGroup.fromJson(d));
          update();
        }
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
