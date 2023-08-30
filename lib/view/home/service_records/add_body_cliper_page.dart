import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/raw_date.dart';
import 'package:hourse_lux/core/helpers/service_type_helper.dart';
import 'package:hourse_lux/core/service_controller.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/my_input_shadow.dart';
import '../../../core/constant/colors.dart';
import '../../../widgets/selected_horses_widget.dart';
import '../contact_screen.dart';

class AddBodyClipperPage extends StatefulWidget {
  final String type;
  const AddBodyClipperPage({super.key,required this.type});

  @override
  State<AddBodyClipperPage> createState() => _AddBodyClipperPageState();
}

class _AddBodyClipperPageState extends State<AddBodyClipperPage> {
  final service = Get.put(ServiceController());
  @override
  void dispose() {
    service.clearData();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: "Add ${widget.type}")),
        preferredSize: Size.fromHeight(62),
      ),
      body: GetBuilder(
          init: service,
          builder: (_) {
            return ListView(
              children: [
                SizedBox(height: 20),
                SelectedHorseWidget(),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text("Details",style: Get.textTheme.bodyLarge!.copyWith(color: Colors.black)),
                ),
                SizedBox(height: 10),
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
                    title: "Administrated By",
                    widget: InkWell(
                      onTap: (){
                        Get.to(ContactScreen(
                          selectMode: true,
                          onSelect: service.selectContact,
                          filters: [],
                        ));
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 16,right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(service.adminContact!=null? "${service.adminContact!.firstName} ${service.adminContact!.lastName}":"Select Contact", style: Get.textTheme.bodyMedium),
                            Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    )
                ),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Price",
                    widget: TextFormField(
                      controller: service.price,
                      keyboardType: TextInputType.number,
                      onChanged: service.changePrice,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "\$ 100",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )
                ),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Quantity",
                    widget: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: service.quantity,
                      onChanged: service.changeQuantity,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "1",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )
                ),
                SizedBox(height: 10),
                MyInputShadow(
                  title: "Cost",
                  widget: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      width: Get.width,
                      child: Text("\$ ${service.cost}",style: Get.textTheme.bodyMedium)),
                ),
                SizedBox(height: 10),
                MyInputShadow(
                    title: "Comments",
                    widget: TextFormField(
                      maxLines: 4,
                      minLines: 4,
                      controller: service.note,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: "comments....",
                        hintStyle: Get.textTheme.bodyMedium,
                        filled: true,
                      ),
                    )
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Attachments",style: Get.textTheme.bodySmall),
                ),
                SizedBox(height: 10),
                service.file != null? Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                  child: Image.file(service.file!),
                ) :Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1,color: Color.fromRGBO(23, 34, 34, 1),),
                        ),
                        child: InkWell(
                          onTap: service.imagePicker,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add),
                              Text("Add Attachments"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                service.state?Container(
                  child: AnimatedLoadingSideWaySurge(
                    expandWidth: 70,
                    borderColor: baseColor,
                    speed: Duration(milliseconds: 600),
                  ),
                ):Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                  child: GestureDetector(
                    onTap: () => service.saveServiceData(type: widget.type, recordType: ServiceTypeHelper.service),
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
            );
          }
      ),
    );
  }
}