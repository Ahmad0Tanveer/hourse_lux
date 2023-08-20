import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/widgets/my_input_shadow.dart';

import '../../../core/constant/colors.dart';
import '../../../widgets/custom_appbar_2.dart';
import '../../../widgets/schedul_type_select.dart';
import 'event_service_type.dart';

class NewEventServicePage extends StatefulWidget {
  const NewEventServicePage({super.key});
  @override
  State<NewEventServicePage> createState() => _NewEventServicePageState();
}

class _NewEventServicePageState extends State<NewEventServicePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            child: CustomAppBar2(title: 'New Event',),
            preferredSize: Size.fromHeight(69),
          ),
          body: ListView(
            children: [
              ScheduleTypeSelect(selectValue: "Service",),
              SizedBox(height: 10),
              MyInputShadow(
                  title: "Service",
                  widget: InkWell(
                    onTap: () => Get.to(() => EventServiceType()),
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 16,right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Select .....", style: Get.textTheme.bodyMedium),
                          Icon(Icons.arrow_drop_down_outlined),
                        ],
                      ),
                    ),
                  )
              ),
              SizedBox(height: 10),
              MyInputShadow(
                  title: "Description",
                  widget: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      hintText: "Description ",
                      hintStyle: Get.textTheme.bodyMedium,
                      filled: true,
                    ),
                  )
              ),
              SizedBox(height: 10),
              MyInputShadow(
                  title: "Horse",
                  widget: InkWell(
                    onTap: () => Get.to(() => EventServiceType()),
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 16,right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Horse Select .....", style: Get.textTheme.bodyMedium),
                          Icon(Icons.arrow_drop_down_outlined),
                        ],
                      ),
                    ),
                  )
              ),
              SizedBox(height: 10),
              MyInputShadow(
                  title: "Participants",
                  widget: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      hintText: "Select Cont... ",
                      hintStyle: Get.textTheme.bodyMedium,
                      filled: true,
                    ),
                  )
              ),
              SizedBox(height: 10),
              MyInputShadow(
                  title: "Administrated By",
                  widget: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      hintText: "Select Cont... ",
                      hintStyle: Get.textTheme.bodyMedium,
                      filled: true,
                    ),
                  )
              ),
              SizedBox(height: 10),
              MyInputShadow(
                  title: "Starts",
                  widget: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      hintText: "15 May 1999",
                      hintStyle: Get.textTheme.bodyMedium,
                      filled: true,
                    ),
                  )
              ),
              SizedBox(height: 10),
              MyInputShadow(
                  title: "Ends",
                  widget: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      hintText: "15 May 1999",
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      hintText: "Add comments....",
                      hintStyle: Get.textTheme.bodyMedium,
                      filled: true,
                    ),
                  )
              ),
              SizedBox(height: 30),
              MyInputShadow(
                  title: "Color",
                  widget: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xff823AC9),
                        ),
                        SizedBox(width: 10),
                        Text("#e411ee",style :Get.textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ))
                      ],
                    ),
                  )
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                child: GestureDetector(
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
              SizedBox(height: 30),
            ],
          ),
        )
    );
  }
}
