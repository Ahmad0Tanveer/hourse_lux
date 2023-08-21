import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/constant/raw_date.dart';
import 'package:hourse_lux/core/service_controller.dart';
import 'package:hourse_lux/widgets/my_input_shadow.dart';
import 'package:hourse_lux/widgets/select_bottom.dart';
import 'package:hourse_lux/widgets/styles.dart';

import '../../../core/helpers/service_type_helper.dart';
import '../../../widgets/custom_appbar_2.dart';
import '../../../widgets/selected_horses_widget.dart';
import '../contact_screen.dart';
import 'add_horse_data.dart';

class AddVitalsPage extends StatefulWidget {
  const AddVitalsPage({super.key});
  @override
  State<AddVitalsPage> createState() => _AddVitalsPageState();
}

class _AddVitalsPageState extends State<AddVitalsPage> {
  final service = Get.put(ServiceController());
  String selectedType = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: "Add Vitals"),),
        preferredSize: Size.fromHeight(62),
      ),
      body: GetBuilder(
          init: service,
          builder: (_) {
            return ListView(
              children: [
                SizedBox(height: 10),
                SelectedHorseWidget(),
                SizedBox(height: 10),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text("Add Details",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
                ),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Date",
                    widget: InkWell(
                      onTap: service.dateDialogOpen,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 50,
                        width: Get.width,
                        alignment: Alignment.centerLeft,
                        child: Text("${service.today.day}-${months[service.today.month-1]}-${service.today.year}"),
                      ),
                    )
                ),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Next Due Date",
                    widget: InkWell(
                      onTap: service.nextDateSelectDialogOpen,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 50,
                        width: Get.width,
                        alignment: Alignment.centerLeft,
                        child: service.nextDate!=null?
                        Text("${service.nextDate!.day}-${months[service.nextDate!.month-1]}-${service.nextDate!.year}"):
                        Text("${service.today.day}-${months[service.today.month-1]}-${service.today.year}"),
                      ),
                    )
                ),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Type",
                    widget: InkWell(
                      onTap: selectType,
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 16,right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectedType.isEmpty? "Select.....":selectedType, style: Get.textTheme.bodyMedium),
                            Icon(Icons.arrow_drop_down_outlined),
                          ],
                        ),
                      ),
                    )
                ),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Administrated By",
                    widget: InkWell(
                      onTap: (){
                        Get.to(ContactScreen(
                          selectMode: true,
                          onSelect: service.selectContact,
                          filters: [],
                        ));
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 16,right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(service.adminContact!=null? "${service.adminContact!.firstName} ${service.adminContact!.lastName}":"Select Contact", style: Get.textTheme.bodyMedium),
                            Icon(Icons.arrow_drop_down_outlined),
                          ],
                        ),
                      ),
                    )
                ),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Price",
                    widget: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "\$ Price",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )
                ),
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
                        hintText: "comments....",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Attachments",style: Get.textTheme.bodySmall),
                ),
                SizedBox(height: 10),
                service.file != null? Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                  child: Image.file(service.file!),
                ) :Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1,color: Color.fromRGBO(23, 34, 34, 1),),
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
                SizedBox(height: 10),
                service.state?Container(
                  child: AnimatedLoadingSideWaySurge(
                    expandWidth: 70,
                    borderColor: baseColor,
                    speed: Duration(milliseconds: 600),
                  ),
                ):Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                  child: GestureDetector(
                    onTap: () => service.saveServiceData(type: selectedType, recordType: ServiceTypeHelper.vitals),
                    child: Container(
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text("Add",style: Get.theme.textTheme.labelMedium),
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            );
          }
      ),
    );
  }
  void selectType() {
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
              onTap: changeType,
              title: "Select Vital Records",
              options: AddHorseData.vitals,
              selectedOption: selectedType,
            ),
          );
        }
    );
  }
  void changeType(text){
    selectedType = text;
    setState(() {});
    Get.back();
  }
}
