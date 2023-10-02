import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/raw_date.dart';
import 'package:hourse_lux/core/service_controller.dart';
import '../core/constant/colors.dart';

class MyDatePickerDialog extends StatefulWidget {
  const MyDatePickerDialog({super.key});
  @override
  State<MyDatePickerDialog> createState() => _MyDatePickerDialogState();
}

class _MyDatePickerDialogState extends State<MyDatePickerDialog> {
  final service = Get.put(ServiceController());
  late DateTime pDate;
  @override
  void initState() {
    pDate = service.today;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: service,
        builder: (_) {
          return Container(
            height: 500,
            width: Get.width,
            child: Column(
              children: [
                Container(
                  height: 73,
                  padding: EdgeInsets.only(left: 20),
                  color: baseColor,
                  alignment: Alignment.centerLeft,
                  child: Text("${service.today.day} ${months[service.today.month-1]}, ${service.today.year}",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),),
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    lastDate: DateTime.now(),
                      calendarType: CalendarDatePicker2Type.single,
                      selectedDayHighlightColor: baseColor,
                  ),
                  value: [service.today],
                  onValueChanged: (dates) {
                    service.selectDate(dates[0]!);
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){
                          service.selectDate(pDate);
                          Get.back();
                        },
                        child: Text("Cancel",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: baseColor,
                        ),)),
                    SizedBox(width: 10),
                    TextButton(
                        onPressed: () => Get.back(),
                        child: Text("Ok",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: baseColor,
                    ),)),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }
}
class SelectNextDateDialog extends StatefulWidget {
  const SelectNextDateDialog({super.key});
  @override
  State<SelectNextDateDialog> createState() => _SelectNextDateDialogState();
}

class _SelectNextDateDialogState extends State<SelectNextDateDialog> {
  final service = Get.put(ServiceController());
  DateTime? pDate;
  @override
  void initState() {
    pDate = service.nextDate;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: service,
        builder: (_) {
          var style = TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          );
          return Container(
            height: 500,
            width: Get.width,
            child: Column(
              children: [
                Container(
                  height: 73,
                  padding: EdgeInsets.only(left: 20),
                  color: baseColor,
                  alignment: Alignment.centerLeft,
                  child: service.nextDate != null?
                  Text("${service.nextDate!.day} ${months[service.nextDate!.month-1]}, ${service.nextDate!.year}",style: style)
                      :Text("${service.today.day} ${months[service.today.month-1]}, ${service.today.year}",style: style),
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                      firstDate: DateTime.now(),
                      calendarType: CalendarDatePicker2Type.single,
                      selectedDayHighlightColor: baseColor,
                      dayTextStyle: TextStyle(
                        fontSize: 14,
                      )
                  ),
                  value: [service.nextDate != null?service.nextDate:DateTime.now()],
                  onValueChanged: (dates) {
                    service.selectNextDate(dates[0]);
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){
                          service.selectNextDate(pDate);
                          Get.back();
                        },
                        child: Text("Cancel",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: baseColor,
                        ),)),
                    SizedBox(width: 10),
                    TextButton(
                        onPressed: () => Get.back(),
                        child: Text("Ok",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: baseColor,
                        ),)),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }
}
