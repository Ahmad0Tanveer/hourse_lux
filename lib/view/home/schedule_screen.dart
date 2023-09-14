import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hourse_lux/core/horse_controller.dart';
import 'package:hourse_lux/core/schedule_controller.dart';
import 'package:hourse_lux/models/horse_model.dart';
import 'package:hourse_lux/models/service_model.dart';
import 'package:hourse_lux/widgets/loading_list_shimmer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'new _nvent/new_event_service_page.dart';
import 'package:hourse_lux/view/home/bottom_nav_bar.dart';
import '../../core/constant/colors.dart';
import 'home_screen.dart';
import 'package:get/get.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final schedule = Get.put(ScheduleController());
  final horse = Get.put(HorseController());
  final nav = Get.put(MyNav());
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;



  final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
  final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);


  @override
  void initState() {
    schedule.init();
    _selectedDay = _focusedDay;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    String transformString(String inputStr) {
      List<String> words = inputStr.split('_');
      words = words.map((word) => word[0].toUpperCase() + word.substring(1)).toList();
      if (words.length > 1) {
        return words.join(' ');
      } else {
        return words[0];
      }
    }
    Widget serviceHorseWidget(ServiceModel model,Color color){
      return GetBuilder(
        init: horse,
        builder: (_) {
         late  HorseModel horseModel;
         for(var h in horse.backup){
           if(h.sId == model.horseId){
             horseModel = h;
           }
         }
          return Container(
            height: 132,
            margin: EdgeInsets.only(top: 10),
            color: color,
            child: Row(
              children: [
                Container(
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("",style: TextStyle(
                        fontSize: 14,
                      ),),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CachedNetworkImage(imageUrl: horseModel.image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(horseModel.neckName,style: TextStyle(
                        fontSize: 14,
                      ),),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${transformString(model.recordType)}",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800
                    ),),
                    Row(
                      children: [
                        Text("Horse: ",style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),),
                        Text("${horseModel.showName}",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Participant(s): ",style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),),
                        Text("Adam Smith",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Admin: ",style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),),
                        Text("${model.adminName}",style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                      ],
                    ),
                    Container(
                      width: Get.width - 140,
                      child:  Text("${model.comment}",
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
          );
        }
      );
    }
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
              onPressed: () => Get.to(() => NewEventServicePage()),
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

      body: GetBuilder(
        init: schedule,
        builder: (_) {
          return ListView(
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
              TableCalendar(
                eventLoader: (DateTime time) {
                  List dots = [];
                  String month = time.month<=9?"0${time.month}": "${time.month}";
                  String day = time.day<=9?"0${time.day}":"${time.day}";
                  for(var data in schedule.backup){
                    if(data.nextDate.split("T00:00:00.000Z").first == "${time.year}-$month-$day"){
                      dots.add(3);
                    }
                  }
                  return dots;
                },
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                rangeSelectionMode: RangeSelectionMode.disabled,
                rangeStartDay: DateTime.now(),

                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  schedule.onDateChange([selectedDay]);
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },

                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),

              SizedBox(height: 10),
              schedule.state?LoadingListShimmerEffect() : Wrap(
                children: schedule.services.map((e) => serviceHorseWidget(
                  e,
                  schedule.services.indexOf(e).isOdd?Colors.orange
                      :Colors.blueAccent,
                )).toList(),
              ),
            ],
          );
        }
      ),
    );
  }
}


final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
