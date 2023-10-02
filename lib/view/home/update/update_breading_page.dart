import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/models/service_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/raw_date.dart';
import '../../../core/service_controller.dart';
import '../../../widgets/my_input_shadow.dart';
import '../../../widgets/select_bottom.dart';
import '../../../widgets/styles.dart';
import '../add_horses/add_horse_data.dart';
import '../contact_screen.dart';

class UpdateBreadingPage extends StatefulWidget {
  final ServiceModel service;

  const UpdateBreadingPage({super.key, required this.service});

  @override
  State<UpdateBreadingPage> createState() => _UpdateBreadingPageState();
}

class _UpdateBreadingPageState extends State<UpdateBreadingPage> {
  final service = Get.put(ServiceController());

  String color = "";
  String name = "";
  String sex = "";
  String marketing = "";
  String stand = "";
  String feed = "";
  String titter = "";

  @override
  void initState() {
    setState(() {
      Map data = jsonDecode(widget.service.extraData);
      if (data["subType"] == "Foaling") {
        color = data["color"] ?? "";
        sex = data["sex"] ?? "";
        name = data["name"] ?? "";
        marketing = data["marketing"] ?? "";
        feed = data["feed"] ?? "";
        titter = data["titter"] ?? "";
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    service.clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget attachmentWidget() {
      return GetBuilder(
          init: service,
          builder: (_) {
            if (service.file != null) {
              return InkWell(
                onTap: service.imagePicker,
                child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Image.file(service.file!),
                ),
              );
            } else {
              return widget.service.image.isNotEmpty
                  ? InkWell(
                      onTap: service.imagePicker,
                      child: Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child:
                            CachedNetworkImage(imageUrl: widget.service.image),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Container(
                            width: 180,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(23, 34, 34, 1),
                              ),
                            ),
                            child: InkWell(
                              onTap: service.imagePicker,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add),
                                  Text("Add Attachments"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            }
          });
    }

    Widget recordWidget() {
      if (true) {
        return Card(
          elevation: 10,
          margin: EdgeInsets.all(13),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Color(0xffD9D9D9), width: 1)),
          child: Container(
            width: Get.width,
            padding: EdgeInsets.all(11),
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Foal Details:", style: TextStyle(fontSize: 14)),
                SizedBox(height: 15),
                Text("Name",
                    style: TextStyle(
                      color: baseColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
                Container(
                  height: 35,
                  child: TextFormField(
                    initialValue: name,
                    onChanged: (val) => setState(() {
                      name = val;
                    }),
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      contentPadding: EdgeInsets.only(bottom: 7),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: gray)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text("Sex",
                    style: TextStyle(
                      color: baseColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
                Container(
                  height: 35,
                  child: TextFormField(
                    readOnly: true,
                    onTap: selectSex,
                    decoration: InputDecoration(
                      hintText: sex.isEmpty ? "Select ..." : sex,
                      contentPadding: EdgeInsets.only(bottom: 7),
                      hintStyle: TextStyle(
                        color: sex.isEmpty ? null : baseColor,
                      ),
                      suffixIcon: Icon(Icons.arrow_drop_down_rounded),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: gray)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text("Color",
                    style: TextStyle(
                      color: baseColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
                Container(
                  height: 35,
                  child: TextField(
                    readOnly: true,
                    onTap: selectColor,
                    decoration: InputDecoration(
                      hintText: color.isEmpty ? "Select ..." : color,
                      hintStyle: TextStyle(
                        color: color.isEmpty ? null : baseColor,
                      ),
                      suffixIcon: Icon(Icons.arrow_drop_down_rounded),
                      contentPadding: EdgeInsets.only(bottom: 7),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: gray)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text("Marking",
                    style: TextStyle(
                      color: baseColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
                Container(
                  height: 35,
                  child: TextFormField(
                    initialValue: marketing,
                    onChanged: (val) => setState(() {
                      marketing = val;
                    }),
                    decoration: InputDecoration(
                      hintText: "foal marking",
                      contentPadding: EdgeInsets.only(bottom: 7),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: gray)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text("Length to stand",
                    style: TextStyle(
                      color: baseColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
                Container(
                  height: 35,
                  child: TextFormField(
                    initialValue: stand,
                    onChanged: (val) => setState(() {
                      stand = val;
                    }),
                    decoration: InputDecoration(
                      hintText: "foal length to stand",
                      contentPadding: EdgeInsets.only(bottom: 7),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: gray)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text("Length to feed",
                    style: TextStyle(
                      color: baseColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
                Container(
                  height: 35,
                  child: TextFormField(
                    initialValue: feed,
                    onChanged: (val) => setState(() {
                      feed = val;
                    }),
                    decoration: InputDecoration(
                      hintText: "Foal length to feed",
                      contentPadding: EdgeInsets.only(bottom: 7),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: gray)),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text("IGG Titter",
                    style: TextStyle(
                      color: baseColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
                Container(
                  height: 35,
                  child: TextFormField(
                    initialValue: titter,
                    onChanged: (val) => setState(() {
                      titter = val;
                    }),
                    decoration: InputDecoration(
                      hintText: "Foal igg titter",
                      contentPadding: EdgeInsets.only(bottom: 7),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: gray)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }

    return GetBuilder(
        init: service,
        builder: (_) {
          return Container(
            child: Column(
              children: [
                MyInputShadow(
                    title: "Date",
                    widget: InkWell(
                      onTap: service.dateDialogOpen,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 50,
                        width: Get.width,
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "${service.today.day}-${months[service.today.month - 1]}-${service.today.year}"),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                MyInputShadow(
                    title: "Administrated By",
                    widget: InkWell(
                      onTap: () {
                        Get.to(ContactScreen(
                          selectMode: true,
                          onSelect: service.selectContact,
                          filters: [],
                        ));
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                service.adminContact != null
                                    ? "${service.adminContact!.firstName} ${service.adminContact!.lastName}"
                                    : "Select Contact",
                                style: Get.textTheme.bodyMedium),
                            Icon(Icons.arrow_drop_down_outlined),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                MyInputShadow(
                    title: "Price",
                    widget: TextFormField(
                      controller: service.price,
                      keyboardType: TextInputType.number,
                      onChanged: service.changePrice,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "\$ 100",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )),
                recordWidget(),
                MyInputShadow(
                    title: "Comments",
                    widget: TextFormField(
                      maxLines: 4,
                      minLines: 4,
                      controller: service.note,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "comments....",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                attachmentWidget(),
                SizedBox(
                  height: 15,
                ),
                service.state
                    ? Container(
                        child: AnimatedLoadingSideWaySurge(
                          expandWidth: 70,
                          borderColor: baseColor,
                          speed: Duration(milliseconds: 600),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: GestureDetector(
                          child: InkWell(
                            onTap: () {
                              Map<String, String> map = {
                                "date": service.today.toString(),
                                "comment": service.note.text,
                                "adminName": service.adminContact!.firstName + " " + service.adminContact!.lastName,
                                "adminId": service.adminContact!.id,
                                "price": service.price.text,
                              };
                              Map data = jsonDecode(widget.service.extraData);
                              if (data["subType"] == "Foaling") {
                                map["color"]  = color;
                                map["sex"]  = sex;
                                map["name"]  = name;
                                map["marketing"]  = marketing;
                                map["feed"]  = feed;
                                map["titter"]  = titter;
                              }
                              service.updateRecord(id: widget.service.id, map: map);
                            },
                            child: Container(
                              height: 55,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: baseColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("Save Changes",
                                  style: Get.theme.textTheme.labelMedium),
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 50),
              ],
            ),
          );
        });
  }

  void selectSex() {
    showModalBottomSheet(
        context: Get.context!,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: SelectBottomSheet(
              onTap: changeGender,
              title: "Select Horse Sex",
              options: AddHorseData.sexes,
              selectedOption: sex,
            ),
          );
        });
  }

  void selectColor() {
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        enableDrag: true,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: SelectBottomSheet(
              onTap: changeColor,
              title: "Select Horse Color",
              options: AddHorseData.colors,
              selectedOption: color,
            ),
          );
        });
  }

  void changeColor(String vale) {
    setState(() {
      color = vale;
      Get.back();
    });
  }

  void changeGender(String vale) {
    setState(() {
      sex = vale;
      Get.back();
    });
  }
}
