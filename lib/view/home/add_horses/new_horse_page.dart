import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/horse_controller.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/select_bottom.dart';
import 'package:hourse_lux/widgets/styles.dart';
import '../../../core/helpers/validdation_helper.dart';
import '../../../widgets/my_input_shadow.dart';
import '../contact_screen.dart';
import 'add_horse_data.dart';

class CreateNewHorse extends StatefulWidget {
  const CreateNewHorse({super.key});
  @override
  State<CreateNewHorse> createState() => _CreateNewHorseState();
}

class _CreateNewHorseState extends State<CreateNewHorse> {
  final horse = Get.put(HorseController());
  String selectBreedString = "";
  String selectColorString = "";
  String selectSexString = "";
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: horse,
      builder: (_) {
        return Scaffold(
          appBar: PreferredSize(
            child: SafeArea(child: CustomAppBar2(title: "Add new horses")),
            preferredSize: Size.fromHeight(62),
          ),
          body: Container(
            child: Form(
              key: horse.form,
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text("BASIC INFO",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
                  ),
                  SizedBox(height: 10),
                  MyInputShadow(
                      title: "Nick Name",
                      widget: TextFormField(
                        controller: horse.name,
                        validator: ValidationHelpers.fieldRequired,
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
                        controller: horse.showName,
                        validator: ValidationHelpers.fieldRequired,
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
                      widget: InkWell(
                        onTap: (){
                          Get.to(ContactScreen(
                            selectMode: true,
                            onSelect: horse.selectHorseOwner,
                          ));
                        },
                        child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(horse.contactOwner!=null?
                              "${horse.contactOwner!.firstName} ${horse.contactOwner!.lastName}"
                                  :"Select Contact..."
                                  , style: Get.textTheme.bodyMedium),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 10),
                  MyInputShadow(
                      title: "Bill Payer",
                      widget: InkWell(
                        onTap: (){
                          Get.to(ContactScreen(
                            selectMode: true,
                            onSelect: horse.selectHorseBillPayer,
                          ));
                        },
                        child: Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(horse.contactBillPayer!=null?
                              "${horse.contactBillPayer!.firstName} ${horse.contactBillPayer!.lastName}"
                                  :"Select Contact...", style: Get.textTheme.bodyMedium),
                              Icon(Icons.arrow_right),
                            ],
                          ),
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
                              Text(selectBreedString.isEmpty?"Bread":selectBreedString, style: Get.textTheme.bodyMedium),
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
                              Text(selectColorString.isEmpty?"Select Color ...":selectColorString, style: Get.textTheme.bodyMedium),
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
                              Text(selectSexString.isNotEmpty?selectSexString:"Select...", style: Get.textTheme.bodyMedium),
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
               horse.file == null?    Container(
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
                          child: GestureDetector(
                            onTap: horse.imagePicker,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Text("Add photo"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ):Image.file(horse.file!),
                  SizedBox(height: 20),
                  MyInputShadow(
                      title: "Microchip",
                      widget: TextFormField(
                        validator: ValidationHelpers.fieldRequired,
                        controller: horse.microsChip,
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
                        validator: ValidationHelpers.fieldRequired,
                        controller: horse.stallName,
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
                        controller: horse.stallNot,
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
                        validator: ValidationHelpers.fieldRequired,
                        controller: horse.paddockName,
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
                        controller: horse.paddockLocation,
                        validator: ValidationHelpers.fieldRequired,
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
                        controller: horse.paddockNote,
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
                horse.state?Container(
                  child: AnimatedLoadingSideWaySurge(
                    expandWidth: 70,
                    borderColor: baseColor,
                    speed: Duration(milliseconds: 600),
                  ),
                ):  Container(
                    margin: EdgeInsets.only(left: 16,right: 16),
                    child: GestureDetector(
                      onTap: () => horse.addHorseData(bread: selectBreedString, color: selectColorString, sex: selectSexString),
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
          ),
        );
      }
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
