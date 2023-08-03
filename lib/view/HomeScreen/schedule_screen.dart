import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1000,
        centerTitle: true,
        leading: Icon(Icons.menu,color: Colors.black),
        title: Text("Schedule".toUpperCase(),style: Get.theme.textTheme.bodyMedium),
        actions: [
          TextButton(
              onPressed: (){},
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black,width: 2),
                ),
                child: Icon(Icons.add,
                  color: Colors.black,
                ),
              )
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 73,
            color: baseColor,
            alignment: Alignment.centerLeft,
            child: Text("Thur, June, 2023",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),),
          ),
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.multi,

            ),
            value: [DateTime.now()],
            onValueChanged: (dates) {},
          ),
          SizedBox(height: 10),
          Container(
            height: 132,
            color: Color.fromRGBO(237, 183, 56,1),
            child: Row(
              children: [
                Container(
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("5 AM"),
                      Image.asset("assets/images/h1.png",width: 53,height: 53),
                      Text("Ferris"),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Office Fee: Paying Fee",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    ),),
                    Row(
                      children: [
                        Text("Horse: ",style: TextStyle(fontWeight: FontWeight.w700),),
                        Text("Jupiter"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Participant(s): ",style: TextStyle(fontWeight: FontWeight.w700),),
                        Text("Adam Smith"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Admin: ",style: TextStyle(fontWeight: FontWeight.w700),),
                        Text("John son"),
                      ],
                    ),
                   Container(
                     width: Get.width - 140,
                     child:  Text("Lorem Ipsum is simply dummy text of the printing and.",overflow: TextOverflow.ellipsis),)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 132,
            color: Color.fromRGBO(151, 71, 255,1),
            child: Row(
              children: [
                Container(
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("5 AM"),
                      Image.asset("assets/images/h1.png",width: 53,height: 53),
                      Text("Ferris"),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Office Fee: Paying Fee",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    ),),
                    Row(
                      children: [
                        Text("Horse: ",style: TextStyle(fontWeight: FontWeight.w700),),
                        Text("Jupiter"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Participant(s): ",style: TextStyle(fontWeight: FontWeight.w700),),
                        Text("Adam Smith"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Admin: ",style: TextStyle(fontWeight: FontWeight.w700),),
                        Text("John son"),
                      ],
                    ),
                    Container(
                      width: Get.width - 140,
                      child:  Text("Lorem Ipsum is simply dummy text of the printing and.",overflow: TextOverflow.ellipsis),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
