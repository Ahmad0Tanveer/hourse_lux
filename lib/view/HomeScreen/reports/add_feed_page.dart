import 'package:flutter/material.dart';
import 'package:hourse_lux/core/constant/colors.dart';

import '../../../widgets/custom_appbar_2.dart';

class AddFeedPage extends StatefulWidget {
  const AddFeedPage({super.key});
  @override
  State<AddFeedPage> createState() => _AddFeedPageState();
}

class _AddFeedPageState extends State<AddFeedPage> {
  List<String> list = ["alfalfa cubes", "barley", "beet pulp", "bran", "bran mash", "cob (corn oats barley)", "complete", "corn", "hay cubes", "oats", "pellete 10%", "pellete 12%", "pellete 14%", "pellete 16%", "senior", "sweet feed", "Other"];
  List<String> fractions = ["1/4","1/2","3/4"];
  List<String> times = ["AM","LUNCH","PM","NIGHT"];
  List<String> units = ["buckets", "cups", "flakes", "haynet", "pounds", "quarts", "scoops", "Other"];
  String selectOption = "";
  String selectedTime = "AM";
  String selectedFraction = "AM";
  String selectedUnit = "AM";
  void changeTime(time){
    selectedTime = time;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: "FEED: Harry")),
        preferredSize: Size.fromHeight(69),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: times.map((e) {
                  bool active  = e == selectedTime;
                  return InkWell(
                    onTap: () => changeTime(e),
                    child: Container(
                      padding: EdgeInsets.only(left: 16,right: 16,top: 5,bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: active?baseColor:Color(0xffB0B0B0)
                      ),
                      child: Text(e,style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 40),
            Text("AM MEAL:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
            Container(
              height: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: baseColor,width: 1)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Text("Add Feed")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Text("Supplement",style: TextStyle(
                color: Color(0xff2C3A4B),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),),
            ),
            SizedBox(height: 10),
            Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xffD9D9D9),width: 1)
                ),
                child: TextField(
                  maxLines: 6,
                  minLines: 6,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
