import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/models/service_model.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/raw_date.dart';
import '../../../core/service_controller.dart';
import '../../../widgets/my_input_shadow.dart';
import '../contact_screen.dart';

class UpdateTemperaturePage extends StatefulWidget {
  final ServiceModel service;

  const UpdateTemperaturePage({super.key, required this.service});

  @override
  State<UpdateTemperaturePage> createState() => _UpdateTemperaturePageState();
}

class _UpdateTemperaturePageState extends State<UpdateTemperaturePage> {
  final service = Get.put(ServiceController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    service.clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget currentDate() {
      return GetBuilder(
          init: service,
          builder: (_) => MyInputShadow(
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
              )));
    }

    Widget commentWidget() {
      return GetBuilder(
        init: service,
        builder: (_) => MyInputShadow(
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
      );
    }

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

    return GetBuilder(
        init: service,
        builder: (_) {
          return Column(
            children: [
              currentDate(),
              SizedBox(height: 10),
              MyInputShadow(
                  title: "Value (°F)",
                  widget: TextFormField(
                    controller: service.value,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      hintText: "Measured Value",
                      hintStyle: Get.textTheme.bodyMedium,
                      filled: true,
                    ),
                  )),
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              commentWidget(),
              SizedBox(height: 10),
              attachmentWidget(),
              SizedBox(height: 10),
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
                              "value": service.value.text,
                              "adminName": service.adminContact!.firstName +
                                  " " +
                                  service.adminContact!.lastName,
                              "adminId": service.adminContact!.id,
                            };
                            service.updateRecord(
                                id: widget.service.id, map: map);
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
          );
        });
  }
}
