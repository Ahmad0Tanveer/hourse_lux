import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/contact_controller.dart';
import 'package:hourse_lux/core/horse_controller.dart';
import 'package:hourse_lux/models/horse_model.dart';
import '../../../core/constant/colors.dart';
import '../../../widgets/custom_appbar_2.dart';
import '../../../widgets/my_input_shadow.dart';
import '../contact_screen.dart';
import 'selecthorse_ownergroud.dart';

class NewOwnerGroup extends StatefulWidget {
  const NewOwnerGroup({super.key});

  @override
  State<NewOwnerGroup> createState() => _NewOwnerGroupState();
}

class _NewOwnerGroupState extends State<NewOwnerGroup> {
  final contact = Get.put(ContactController());
  final horse = Get.put(HorseController());
  @override
  Widget build(BuildContext context) {
    Widget selectHorsWidget(){
      return GetBuilder(
        init: contact,
        builder: (_) {
          HorseModel? model;
          for(var h in horse.backup){
            if(h.sId== contact.selectedHorseId){
              model = h;
            }
          }
          return Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                model != null?  Column(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: CachedNetworkImageProvider(
                        model.image,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(model.neckName),
                  ],
                ):SizedBox(),
                SizedBox(width: 16),
                InkWell(
                  onTap: (){
                    Get.to(() => SelectHorseForOwnerGroup());
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 39,
                        width: 39,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add),
                      ),
                      SizedBox(height: 3),
                      Text("Add"),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      );
    }
    Widget groutOwner(k, v) {
      return GetBuilder(
          init: contact,
          builder: (_) {
            String name = contact.sharesName[k]??"";
            return Card(
                elevation: 10,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xffD9D9D9), width: 1)),
                child: Container(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        child: Text("Owner", style: Get.textTheme.bodySmall),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Get.to(ContactScreen(
                            selectMode: true,
                            onSelect: contact.selectContact,
                            filters: [],
                          ));
                        },
                        child: Container(
                          height: 35,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 16),
                          child: Text(name.isEmpty? "Select....":name,
                              style: Get.textTheme.bodyMedium),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        child:
                            Text("Percentage", style: Get.textTheme.bodySmall),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (v) => contact.onChangeShare(k,v),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                          hintText: "0 % ",
                          hintStyle: Get.textTheme.bodyMedium,
                          filled: true,
                        ),
                      )
                    ],
                  ),
                ));
          });
    }

    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
            child: CustomAppBar2(
          title: 'New Owner Group',
        )),
        preferredSize: Size.fromHeight(69),
      ),
      body: GetBuilder(
          init: contact,
          builder: (_) {
            return ListView(
              children: [
                SizedBox(height: 20),
                Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 16),
                  child: Text("GROUP INFO AND MEMBERS",
                      style: Get.textTheme.bodyLarge!
                          .copyWith(color: Colors.black)),
                ),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Group Name",
                    widget: TextFormField(
                      controller: contact.oName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "name ",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )),
                SizedBox(height: 10),
                Wrap(
                  children: contact.shares.keys
                      .map((e) => groutOwner(e, contact.shares[e]))
                      .toList(),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: contact.addMember,
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(23, 34, 34, 1),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add),
                              Text("Add Group Member "),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                MyInputShadow(
                    title: "USEF Number",
                    widget: TextFormField(
                      controller: contact.oNumber,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "usef number ",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Comments",
                    widget: TextFormField(
                      maxLines: 4,
                      minLines: 4,
                      controller: contact.oComment,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "Add comments....",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )),
                SizedBox(height: 16),
                Container(
                  width: Get.width,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 16),
                  child: Text("GROUP INFO AND MEMBERS",
                      style: Get.textTheme.bodyLarge!
                          .copyWith(color: Colors.black)),
                ),
                SizedBox(height: 26),
                selectHorsWidget(),
                SizedBox(height: 26),
                contact.state? Container(
                  child: AnimatedLoadingSideWaySurge(
                    expandWidth: 70,
                    borderColor: baseColor,
                    speed: Duration(milliseconds: 600),
                  ),
                ):InkWell(
                  onTap: contact.addOwnerGroup,
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: GestureDetector(
                      child: Container(
                        height: 55,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: baseColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Save", style: Get.theme.textTheme.labelMedium),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            );
          }),
    );
  }
}
