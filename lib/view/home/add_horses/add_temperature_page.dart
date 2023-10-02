import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/helpers/service_type_helper.dart';
import 'package:hourse_lux/core/service_controller.dart';
import 'package:hourse_lux/widgets/my_input_shadow.dart';
import 'package:hourse_lux/widgets/selected_horses_widget.dart';
import '../../../core/constant/raw_date.dart';
import '../../../widgets/custom_appbar_2.dart';
import '../contact_screen.dart';

class AddTemperaturePage extends StatefulWidget {
  const AddTemperaturePage({super.key});
  @override
  State<AddTemperaturePage> createState() => _AddTemperaturePageState();
}

class _AddTemperaturePageState extends State<AddTemperaturePage> {
  final service = Get.put(ServiceController());
  @override
  void dispose() {
    service.clearData();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: "Add Temperature")),
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
              /*MyInputShadow(
                  title: "Time",
                  widget: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      hintText: "${service.today.hour>12?service.today.hour-12: service.today.hour} : ${service.today.minute} ${service.today.hour>12?"PM":"AM"}",
                      hintStyle: Get.textTheme.bodyMedium,
                      filled: true,
                    ),
                  )
              ),*/
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
                  )
              ),
              SizedBox(height: 10),
              MyInputShadow(
                  title: "Administrated By",
                  widget: InkWell(
                    onTap: (){
                      Get.to(
                          ContactScreen(
                            selectMode: true,
                            onSelect: service.selectContact,
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
                  title: "Notes",
                  widget: TextFormField(
                    maxLines: 4,
                    minLines: 4,
                    controller: service.note,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      hintText: "Write Notes....",
                      hintStyle: Get.textTheme.bodyMedium,
                      filled: true,
                    ),
                  )
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Text("Attachments",style: Get.textTheme.bodySmall),
              ),
              SizedBox(height: 10),
              service.file != null?  Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                  child: Image.file(service.file!)) :Container(
                margin: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    InkWell(
                      onTap: service.imagePicker,
                      child: Container(
                        width: 170,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(width: 1,color: Color.fromRGBO(23, 34, 34, 1),),
                        ),
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
              SizedBox(height: 32),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                child: GestureDetector(
                  onTap: () => service.saveServiceData(type: "",recordType: ServiceTypeHelper.temperature),
                  child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("Save",style: Get.theme.textTheme.labelMedium),
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
}
