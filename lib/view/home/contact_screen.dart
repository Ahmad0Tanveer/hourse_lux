import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/contact_controller.dart';
import 'package:hourse_lux/models/contact_model.dart';
import 'package:hourse_lux/view/home/add_contacts/add_contact_dialog.dart';
import 'package:hourse_lux/view/customs/custom_search.dart';
import 'package:hourse_lux/view/customs/custom_text.dart';
import 'package:hourse_lux/view/drawer/drawer.dart';
import 'package:hourse_lux/widgets/loading_list_shimmer.dart';
import 'add_contacts/add_conatact_page.dart';
import 'add_contacts/contact_detail_page.dart';
import 'add_contacts/contact_owner_detail_page.dart';
import 'home_screen.dart';

class ContactScreen extends StatefulWidget {
  bool selectMode;
  List<String> filters;
  Function(ContactModel)? onSelect;
  ContactScreen({super.key,this.selectMode = false,this.filters = const [],this.onSelect});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool contactActive = true;
  final contact = Get.put(ContactController());
  String firstChar = "";
  @override
  void initState() {
    contact.initContacts();
    if(widget.filters.isNotEmpty){
      contact.setFilters(widget.filters);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: scaffoldKey,
      child: GetBuilder(
        init: contact,
        builder: (_) {
          return Scaffold(
            backgroundColor: whiteColor,
            drawer: MyDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              elevation: 1000,
              title: Row(
                children: [
                  InkWell(
                    onTap: (){
                      scaffoldKey.currentState!.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  CustomText(
                    text: "CONTACTS",
                    fontSize: 18.sp,
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      Get.dialog(
                          barrierColor: Colors.transparent,
                          Dialog(
                            child: AddContactDialog(),
                          ));
                    },
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(width: 7.w),
                  IconButton(
                    onPressed: () => Get.to(() => AddContactPage()),
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: blackColor,
                    ),
                  )
                ],
              ),
            ),
            body: ListView(
              children: [
                SizedBox(height: 6.h),
                CustomSearchTextField(),
                SizedBox(height: 37.h),
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap:() => setState(() {contactActive = true;}),
                        child: Container(
                          height: 36,
                          padding: EdgeInsets.only(left: 12,right: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: baseColor,width: 1),
                            color: contactActive?baseColor:Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft:  Radius.circular(4),
                            ),
                          ),
                          child: Text("Contacts",style: TextStyle(
                            color: contactActive?Colors.white:Colors.black,
                          ),),
                        ),
                      ),
                      GestureDetector(
                        onTap:() => setState(() {contactActive = false;}),
                        child: Container(
                          height: 36,
                          padding: EdgeInsets.only(left: 12,right: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: !contactActive?baseColor:Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight:  Radius.circular(4),
                            ),
                            border: Border.all(color: baseColor,width: 1),
                          ),
                          child: Text("Owner Group",style: TextStyle(
                            color: !contactActive?Colors.white:Colors.black,
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 37.h),
              contactActive?
            !contact.state?  ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Disable inner ListView's scrolling
                itemCount: contact.contacts.length,
                itemBuilder: (context, index) {
                  bool show = true;
                  if(index == 0){
                    firstChar = contact.contacts[index].fullName[0].toUpperCase();
                  } else if(firstChar != contact.contacts[index].fullName[0].toUpperCase()){
                    firstChar = contact.contacts[index].fullName[0].toUpperCase();
                    show = true;
                    print(firstChar);
                  }else {
                     show = false;
                  }
                  return Column(
                    children: [
                      show?  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            CustomText(
                              text: firstChar,
                              fontSize: 18.sp,
                              color: blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ):Container(),
                      show?   Padding(
                        padding: EdgeInsets.only(
                          left: 17,
                          right: 17,
                          top: 5,
                          bottom: 15,
                        ),
                        child: Divider(thickness: 1.3),
                      ):Container(),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                             if(widget.selectMode){
                              widget.onSelect!(contact.contacts[index]);
                              Get.back();
                             } else {
                               Get.to(() => ContactDetailPage(contact: contact.contacts[index]));
                             }
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 12,
                                    bottom: 15,
                                  ),
                                  child: CustomText(
                                    text: "${contact.contacts[index].fullName} ${contact.contacts[index].lastName}",
                                    color: blackColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: blackColor,
                                  size: 18.sp,
                                ),
                                SizedBox(width: 20)
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ):Container(
                child: LoadingListShimmerEffect(),
            ):
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: 8),
                    Container(height: 1,color: Color(0xffD7D7D7),),
                    SizedBox(height: 24),
                    Container(
                      child: InkWell(
                        onTap: () => Get.to(() => ContactOwnerGroupDetailPage()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Group 1",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),),
                                Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                              ],
                            ),
                            SizedBox(height: 16),
                            Text("Owners: Johnson (50%), Ahmad (50%)",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),),
                            SizedBox(height: 8),
                            Text("Horses: Harry, Ferris",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),),
                            SizedBox(height: 24),
                            Container(height: 1,color: Color(0xffD7D7D7),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      child: InkWell(
                        onTap: () => Get.to(() => ContactOwnerGroupDetailPage()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Group 2",style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),),
                                Icon(Icons.arrow_forward_ios_outlined,size: 20,)
                              ],
                            ),
                            SizedBox(height: 16),
                            Text("Owners: Johnson (50%), Ahmad (50%)",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),),
                            SizedBox(height: 8),
                            Text("Horses: Harry, Ferris",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),),
                            SizedBox(height: 24),
                            Container(height: 1,color: Color(0xffD7D7D7),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ],
            ),
          );
        }
      ),
    );
  }
}
