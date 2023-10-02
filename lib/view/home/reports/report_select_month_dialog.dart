import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/activity_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../models/ui/data_filter_model.dart';

class SelectMonthDialog extends StatefulWidget {
  const SelectMonthDialog({super.key});
  @override
  State<SelectMonthDialog> createState() => _SelectMonthDialogState();
}


class _SelectMonthDialogState extends State<SelectMonthDialog> {
  final activity = Get.put(ActivityController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dateFilters.length * 70,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: dateFilters.length,
          itemBuilder: (context,index){
            DataFilterModel model = dateFilters[index];
            return InkWell(
              onTap: () {
                if(!model.custom) {
                  activity.selectDate(s: model.s,l: model.l);
                } else {

                }
              },
              child: Container(
                height: 40,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 16,right: 16,top: 16),
                color: Colors.white,
                child: Text(model.title,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),)
              ),
            );
          },
        ),
      ),
    );
  }
}
