import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';

import '../../../widgets/custom_appbar_2.dart';
import '../../../widgets/select_bottom.dart';
import '../../../widgets/styles.dart';

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
  String selectedFraction = "Select Fraction";
  String selectedUnit = "Select Units";

  bool addFeed = false;
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
            SizedBox(height: 16),
            addFeed?myInfoWidget():  InkWell(
              onTap: changeAddFeedType,
              child: Container(
                height: 170,
                margin: EdgeInsets.only(left: 10),
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
            ),
            SizedBox(height: 16),
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
              color: Colors.transparent,
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
  Widget myInfoWidget(){
    var style = TextStyle(
      color: Color(0xff2C3A4B),
      fontWeight: FontWeight.w600,
      fontSize: 10,
    );
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.all(16),
      height: 180,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black,width: 1),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$selectOption",style: TextStyle(
            fontWeight: FontWeight.w600,
            color: baseColor,
            fontSize: 14,
          ),),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width/2- 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quantity:",style: style),
                    Container(
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: false,
                          hintText: "i.e. 1,2,7",
                          hintStyle: style,
                          border: UnderlineInputBorder()
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width/2- 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("",style: style),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xffADADAD), // Change this color as needed
                            width: 1.0,          // Change this width as needed
                          ),
                        ),
                      ),
                      height: 35,
                      child: InkWell(
                        onTap: fractionSelect,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("$selectedFraction",style: style),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            width: Get.width- 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Units:",style: style),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffADADAD), // Change this color as needed
                        width: 1.0,          // Change this width as needed
                      ),
                    ),
                  ),
                  height: 35,
                  child: InkWell(
                    onTap: changeUnitSheet,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("$selectedUnit",style: style),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void changeAddFeedType(){
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        enableDrag: true,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: SelectBottomSheet(
              onTap: changeFeed,
              title: "Add Feed",
              options: list,
              selectedOption: selectOption,
            ),
          );
        }
    );
  }
  void changeFeed(f){
    setState(() {
      selectOption = f;
      addFeed = true;
      Get.back();
    });
  }
  void changeUnitSheet(){
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        enableDrag: true,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: SelectBottomSheet(
              onTap: changeUnit,
              title: "Select Units",
              options: units,
              selectedOption: selectedUnit,
            ),
          );
        }
    );
  }
  void fractionSelect(){
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        enableDrag: true,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: 250,
            child: SelectBottomSheet(
              onTap: changeUnit,
              title: "Select Fraction",
              options: fractions,
              selectedOption: selectedFraction,
            ),
          );
        }
    );
  }
  void changeUnit(u){
    selectedUnit = u;
    setState(() {});
    Get.back();
  }
  void changeFraction(f){
    setState(() {
      selectedFraction = f;
      Get.back();
    });
  }
}
