import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/HomeScreen/new _nvent/new_even_appointment_page.dart';
import '../view/HomeScreen/new _nvent/new_event_service_page.dart';
import '../view/HomeScreen/new _nvent/new_event_task_page.dart';
import 'my_input_shadow.dart';

class ScheduleTypeSelect extends StatefulWidget {
  final String selectValue;
  const ScheduleTypeSelect({super.key,required this.selectValue});
  @override
  State<ScheduleTypeSelect> createState() => _ScheduleTypeSelectState();
}

class _ScheduleTypeSelectState extends State<ScheduleTypeSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  MyInputShadow(
          title: "Type",
          widget: InkWell(
            onTap: (){},
            child: Container(
              height: 50,
              padding: EdgeInsets.only(left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.selectValue}", style: Get.textTheme.bodyMedium),
                  PopupMenuButton(
                    onSelected: onSelectValue,
                    child: Icon(Icons.arrow_drop_down_outlined),
                      itemBuilder: (context){
                          return [
                            PopupMenuItem(
                                value: "Service",
                                child: Text("Service")
                            ),
                            PopupMenuItem(
                                value: "Service",
                                child: Text("Appointment")
                            ),
                            PopupMenuItem(
                                value: "Task",
                                child: Text("Task")
                            ),
                          ];
                      }
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
  void onSelectValue(value){
    print(value);
    if(value == "Task"){
      Get.off(NewEventTaskPage());
    } else if (value == "Service"){
      Get.off(NewEventServicePage());
    } else {
      Get.off(NewEventAppointmentPage());
    }
  }
}
