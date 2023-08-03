import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';

class SelectMonthDialog extends StatefulWidget {
  const SelectMonthDialog({super.key});
  @override
  State<SelectMonthDialog> createState() => _SelectMonthDialogState();
}

class _SelectMonthDialogState extends State<SelectMonthDialog> {
  List<String> dates = [
    "Past Week",
    "Past Month",
    "Past Year",
    "All Time",
    "Next 6 Months",
    "Custom",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dates.length * 70,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: dates.length,
          itemBuilder: (context,index){
            return Container(
              height: 40,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 16,right: 16,top: 16),
              color: Colors.white,
              child: Text(dates[index],style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),)
            );
          },
        ),
      ),
    );
  }
}
