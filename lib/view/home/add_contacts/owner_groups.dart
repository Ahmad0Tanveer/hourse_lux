import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/models/ownergroup_model.dart';
import '../../../core/contact_controller.dart';
import 'contact_owner_detail_page.dart';

class OwnerGroupsWidget extends StatefulWidget {
  const OwnerGroupsWidget({super.key});
  @override
  State<OwnerGroupsWidget> createState() => _OwnerGroupsWidgetState();
}

class _OwnerGroupsWidgetState extends State<OwnerGroupsWidget> {
  final contact = Get.put(ContactController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      contact.initOwnerGroups();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget groupWidget(OwnerGroup model){
      Map shares = jsonDecode(model.shares);
      return Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        child: Container(
          child: InkWell(
            onTap: () => Get.to(() => ContactOwnerGroupDetailPage()),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${model.name}",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "Owners: ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: Get.width - 104,
                      child: Wrap(
                        children: shares.keys.map((e) {
                          String show = "${contact.sharesName[e]??""}";
                          return Text("$show (${shares[e]})");
                        } ).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Horses: Poni",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  height: 1,
                  color: Color(0xffD7D7D7),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return GetBuilder(
      init: contact,
      builder: (_) {
        return Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              SizedBox(height: 8),
              Container(
                height: 1,
                color: Color(0xffD7D7D7),
              ),
              SizedBox(height: 24),
              Wrap(
                children: contact.groups.map((e) => groupWidget(e)).toList(),
              ),
            ],
          ),
        );
      }
    );
  }
}
