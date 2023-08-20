import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'new _nvent/new_event_service_page.dart';
import 'package:hourse_lux/view/HomeScreen/bottom_nav_bar.dart';
import '../../core/constant/colors.dart';
import 'home_screen.dart';
import 'package:get/get.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final nav = Get.put(MyNav());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1000,
        centerTitle: true,
        leading: Icon(Icons.menu,color: Colors.black),
        title: Text("Schedule".toUpperCase(),style: Get.theme.textTheme.bodyMedium),
        actions: [
          TextButton(
              onPressed: (){
                Get.to(() => NewEventServicePage());
                //nav.changeNav(2);
              },
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
            padding: EdgeInsets.only(left: 20),
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
              calendarType: CalendarDatePicker2Type.single,
              selectedDayHighlightColor: baseColor,
              dayTextStyle: TextStyle(
                fontSize: 14,
              )
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("5 AM",style: TextStyle(
                        fontSize: 14,
                      ),),
                      Image.asset("assets/images/h1.png",width: 50,height: 50),
                      Text("Ferris",style: TextStyle(
                        fontSize: 14,
                      ),),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Office Fee: Paying Fee",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),),
                    Row(
                      children: [
                        Text("Horse: ",style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),),
                        Text("Jupiter",style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Participant(s): ",style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),),
                        Text("Adam Smith",style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Admin: ",style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),),
                        Text("John son",style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                      ],
                    ),

                   Container(
                     width: Get.width - 140,
                     child:  Text("Lorem Ipsum is simply dummy text of the printing and.",
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                         fontSize: 14,
                       ),
                     ),
                   )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 132,
            color: Color(0xff9747FF),
            child: Row(
              children: [
                Container(
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("5 AM",style: TextStyle(
                        fontSize: 14,
                      ),),
                      Image.asset("assets/images/h1.png",width: 50,height: 50),
                      Text("Ferris",style: TextStyle(
                        fontSize: 14,
                      ),),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Office Fee: Paying Fee",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                    ),),
                    Row(
                      children: [
                        Text("Horse: ",style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),),
                        Text("Jupiter",style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Participant(s): ",style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),),
                        Text("Adam Smith",style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Admin: ",style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),),
                        Text("John son",style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                      ],
                    ),

                    Container(
                      width: Get.width - 140,
                      child:  Text("Lorem Ipsum is simply dummy text of the printing and.",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )
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
