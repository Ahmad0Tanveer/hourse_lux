import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/select_bottom.dart';
import 'package:hourse_lux/widgets/styles.dart';
import '../../../widgets/my_input_shadow.dart';
import 'add_horse_data.dart';

class CreateNewHorse extends StatefulWidget {
  const CreateNewHorse({super.key});
  @override
  State<CreateNewHorse> createState() => _CreateNewHorseState();
}

class _CreateNewHorseState extends State<CreateNewHorse> {
  String selectBreedString = "";
  String selectColorString = "";
  String selectSexString = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            CustomAppBar2(title: "Add new horses"),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text("BASIC INFO",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Name",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "(required)",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Show Name",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "Show Name",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Owner",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "Owner Name",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Breed",
                widget: GestureDetector(
                  onTap: selectBreed,
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 16,right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Breed", style: Get.textTheme.bodyMedium),
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                  ),
                )
            ),
            MyInputShadow(
                title: "Color",
                widget: GestureDetector(
                  onTap: selectColor,
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 16,right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select.....", style: Get.textTheme.bodyMedium),
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                  ),
                )
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Sex",
                widget: InkWell(
                  onTap: selectSex,
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 16,right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select.....", style: Get.textTheme.bodyMedium),
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                  ),
                )
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: Text("Photo",style: Get.textTheme.bodySmall),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 1,color: Color.fromRGBO(23, 34, 34, 1),),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("Add photo"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            MyInputShadow(
                title: "Microchip",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "Microchip",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text("STALL",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
            ),
            SizedBox(height: 25),
            MyInputShadow(
                title: "Stall Name",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "Stall Name",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Stall Notes",
                widget: TextFormField(
                  maxLines: 4,
                  minLines: 4,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text("PADDOCK",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
            ),
            SizedBox(height: 20),
            MyInputShadow(
                title: "Paddock Name",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "Paddock Name",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Paddock Location",
                widget: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "Paddock Location",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 10),
            MyInputShadow(
                title: "Paddock Notes",
                widget: TextFormField(
                  minLines: 4,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    hintText: "",
                    hintStyle: Get.textTheme.bodyMedium,
                    filled: true,
                  ),
                )
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 16,right: 16),
              child: GestureDetector(
                child: Container(
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text("Add",style: Get.theme.textTheme.labelMedium),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
  void selectSex(){
    showModalBottomSheet(
        context: Get.context!,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context){
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: SelectBottomSheet(
              onTap: changeGender,
              title: "Select Horse Sex",
              options: AddHorseData.sexes,
              selectedOption: selectSexString,
            ),
          );
        }
    );
  }
  void selectBreed(){
    showModalBottomSheet(
      context: Get.context!,
      shape: HelperStyles.sheetShape,
        isScrollControlled: true,
        enableDrag: true,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: SelectBottomSheet(
              onTap: changeBread,
              title: "Select Horse Breed",
              options: AddHorseData.breads,
              selectedOption: selectBreedString,
            ),
          );
        }
    );

  }
  void selectColor() {
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
              onTap: changeColor,
              title: "Select Horse Color",
              options: AddHorseData.colors,
              selectedOption: selectColorString,
            ),
          );
        }
    );
  }
  void changeBread(String vale){
    setState(() {
      selectBreedString = vale;
      Get.back();
    });
  }
  void changeColor(String vale){
    setState(() {
      selectColorString = vale;
      Get.back();
    });
  }
  void changeGender(String vale){
    setState(() {
      selectSexString = vale;
      Get.back();
    });
  }
}
