import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/raw_date.dart';
import '../../../core/service_controller.dart';
import '../../../models/service_model.dart';
import '../../../widgets/my_input_shadow.dart';

class UpdateRenewalsPage extends StatefulWidget {
  final ServiceModel service;
  const UpdateRenewalsPage({super.key,required this.service});
  @override
  State<UpdateRenewalsPage> createState() => _UpdateRenewalsPageState();
}

class _UpdateRenewalsPageState extends State<UpdateRenewalsPage> {
  final service = Get.put(ServiceController());

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    service.clearData();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: service,
      builder: (_) {
        return Container(
          child: Column(
             children: [
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
                   ),
               ),
               SizedBox(height: 30),
               service.state?Container(
                 child: AnimatedLoadingSideWaySurge(
                   expandWidth: 70,
                   borderColor: baseColor,
                   speed: Duration(milliseconds: 600),
                 ),
               ):Container(
                 margin: EdgeInsets.only(left: 16,right: 16),
                 child: GestureDetector(
                   child: InkWell(
                     onTap: () {
                       Map<String,String> map = {
                         "date": service.today.toString(),
                         "nextDate":  service.nextDate.toString(),
                       };
                       service.updateRecord(id: widget.service.id,map: map);
                     },
                     child: Container(
                       height: 55,
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                           color: baseColor,
                           borderRadius: BorderRadius.circular(20)
                       ),
                       child: Text("Save Changes",style: Get.theme.textTheme.labelMedium),
                     ),
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
