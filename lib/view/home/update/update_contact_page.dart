import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/models/contact_model.dart';

import '../../../core/constant/colors.dart';
import '../../../core/contact_controller.dart';
import '../../../core/helpers/validdation_helper.dart';
import '../../../widgets/custom_appbar_2.dart';
import '../../../widgets/my_input_shadow.dart';
import '../../../widgets/select_bottom.dart';
import '../../../widgets/styles.dart';
import '../add_contacts/add_contact_data.dart';

class UpdateContact extends StatefulWidget {
  final ContactModel contact;
  const UpdateContact({super.key,required this.contact});
  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  var contact = Get.put(ContactController());
  String selectedType = "";
  String selectedTile = "";
  @override
  void initState() {
    setState(() {
      contact.firstName.text = widget.contact.firstName;
      contact.lastName.text = widget.contact.lastName;
      contact.email.text = widget.contact.email;
      contact.phoneNumber.text = widget.contact.primaryPhone;
      selectedType = widget.contact.contactType;
      selectedTile = widget.contact.title;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child:  CustomAppBar2(title: "${widget.contact.firstName} ${widget.contact.lastName}")),
        preferredSize: Size.fromHeight(62),
      ),
      body: GetBuilder(
          init: contact,
          builder: (_) {
            return Form(
              key: contact.form,
              child: ListView(
                children: [
                  SizedBox(height: 10),
                  MyInputShadow(
                      title: "Type",
                      widget: InkWell(
                        onTap: selectContactType,
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.only(left: 16,right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(selectedType.isEmpty? "Select.....": selectedType, style: Get.textTheme.bodyMedium),
                              Icon(Icons.arrow_drop_down_outlined),
                            ],
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: Get.width,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 16),
                    child: Text("Contact Information",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.only(left: 16,right: 16),
                    height: 1,color: Color(0xffD7D7D7),),
                  SizedBox(height: 16),
                  MyInputShadow(
                      title: "Title",
                      widget: InkWell(
                        onTap: selectContactTitle,
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.only(left: 16,right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(selectedTile.isEmpty? "Select.....":selectedTile, style: Get.textTheme.bodyMedium),
                              Icon(Icons.arrow_drop_down_outlined),
                            ],
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 10),
                  MyInputShadow(
                      title: "First Name",
                      widget: TextFormField(
                        controller: contact.firstName,
                        validator: ValidationHelpers.nameValidator,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                          hintText: "Adam ",
                          hintStyle: Get.textTheme.bodyMedium,
                          filled: true,
                        ),
                      )
                  ),
                  SizedBox(height: 10),
                  MyInputShadow(
                      title: "Last Name",
                      widget: TextFormField(
                        controller: contact.lastName,
                        validator: ValidationHelpers.nameValidator,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                          hintText: "Ahmad ",
                          hintStyle: Get.textTheme.bodyMedium,
                          filled: true,
                        ),
                      )
                  ),
                  SizedBox(height: 10),
                  MyInputShadow(
                      title: "Primary Phone",
                      widget: TextFormField(
                        controller: contact.phoneNumber,
                        validator: ValidationHelpers.phoneNumberValidator,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                          hintText: "+44 832938298921",
                          hintStyle: Get.textTheme.bodyMedium,
                          filled: true,
                        ),
                      )
                  ),
                  SizedBox(height: 10),
                  MyInputShadow(
                      title: "Email",
                      widget: TextFormField(
                        controller: contact.email,
                        validator: ValidationHelpers.emailValidator,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                          hintText: "ahmad00tanveer@gmail.com",
                          hintStyle: Get.textTheme.bodyMedium,
                          filled: true,
                        ),
                      )
                  ),
                  SizedBox(height: 10),
                  contact.state?Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )  : Container(
                    margin: EdgeInsets.only(left: 16,right: 16),
                    child: GestureDetector(
                      onTap: () => contact.updateContactId(widget.contact.id,type: selectedType, title: selectedTile),
                      child: Container(
                        height: 55,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: baseColor,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("Save Changes",style: Get.theme.textTheme.labelMedium),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            );
          }
      ),
    );
  }


  void selectContactTitle(){
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        enableDrag: true,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.32,
            child: SelectBottomSheet(
              onTap: changeTitle,
              title: "Select Title",
              options: AddContactData.contactTitles,
              selectedOption: selectedType,
            ),
          );
        }
    );
  }

  void selectContactType(){
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
              onTap: changeType,
              title: "Contact Type",
              options: AddContactData.contactType,
              selectedOption: selectedType,
            ),
          );
        }
    );
  }

  void changeTitle(t){
    setState(() {
      selectedTile = t;
    });
    Get.back();
  }

  void changeType(t){
    setState(() {
      selectedType = t;
    });
    Get.back();
  }
}
