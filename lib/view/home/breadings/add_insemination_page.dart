import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/service_controller.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/my_input_shadow.dart';
import 'package:hourse_lux/widgets/select_bottom.dart';
import 'package:hourse_lux/widgets/styles.dart';
import '../../../core/helpers/service_type_helper.dart';
import '../../../widgets/selected_horses_widget.dart';
import '../contact_screen.dart';
import 'breadings_data.dart';

class AddInseminationPage extends StatefulWidget {
  const AddInseminationPage({super.key});

  @override
  State<AddInseminationPage> createState() => _AddInseminationPageState();
}

class _AddInseminationPageState extends State<AddInseminationPage> {
  final service = Get.put(ServiceController());
  String selectedValue = "";

  @override
  void dispose() {
    service.clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: "Add Insemination")),
        preferredSize: Size.fromHeight(63),
      ),
      body: GetBuilder(
          init: service,
          builder: (_) {
            return ListView(
              children: [
                SelectedHorseWidget(),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Date",
                    widget: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "26-June-2023",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Account",
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
                            Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Price",
                    widget: TextFormField(
                      controller: service.price,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "\$ Price",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Stallion Name",
                    widget: TextFormField(
                      controller: service.under,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "Udder development",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Milk Test pH",
                    widget: TextFormField(
                      controller: service.value,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "pH",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Frequency",
                    widget: TextFormField(
                      controller: service.quantity,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "Frequency",
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
                      controller: service.note,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "Add comments....",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Attachments", style: Get.textTheme.bodySmall),
                ),
                SizedBox(height: 10),
                service.file != null
                    ? Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: Image.file(service.file!),
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
                      ),
                SizedBox(height: 16),
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
                          onTap: () {
                            Map extraData = {
                              "subType": "Insemination",
                              "subValue": service.under.text,
                            };
                            service.saveServiceData(
                                type: selectedValue,
                                recordType: ServiceTypeHelper.breading,
                                extra: extraData);
                          },
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: baseColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("Save",
                                style: Get.theme.textTheme.labelMedium),
                          ),
                        ),
                      ),
                SizedBox(height: 50),
              ],
            );
          }),
    );
  }

  void selectMilkProperties() {
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        enableDrag: true,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: SelectBottomSheet(
              onTap: changeValue,
              title: "Select Insemination Type",
              options: BreadingData.insemination,
              selectedOption: selectedValue,
            ),
          );
        });
  }

  void changeValue(value) {
    setState(() {
      selectedValue = value;
    });
    Get.back();
  }
}
