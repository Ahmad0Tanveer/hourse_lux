import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/constant/raw_date.dart';
import 'package:hourse_lux/core/service_controller.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/my_input_shadow.dart';
import '../../../core/helpers/service_type_helper.dart';
import '../../../widgets/selected_horses_widget.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});
  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final service = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: service,
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            child: SafeArea(child: CustomAppBar2(title: "Add Note")),
            preferredSize: Size.fromHeight(62),
          ),
          body: ListView(
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
              MyInputShadow(
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
              Container(
                margin: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Container(
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
                  ],
                ),
              ),
              SizedBox(height: 16),
            /*  Container(
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Text("Display Note",style: Get.textTheme.bodySmall),
                    ),
                    Switch(value: false, onChanged: (value){})
                  ],
                ),
              ),
              SizedBox(height: 16),*/
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                child: GestureDetector(
                  onTap: () => service.saveServiceData(type: "",recordType: ServiceTypeHelper.notes),
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
          ),
        );
      }
    );
  }
}
