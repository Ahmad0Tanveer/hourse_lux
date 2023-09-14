import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/constant/raw_date.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/selected_horses_widget.dart';

import '../../../core/helpers/service_type_helper.dart';
import '../../../core/service_controller.dart';
import '../../../widgets/my_input_shadow.dart';

class FEIRenewalPage extends StatefulWidget {
  const FEIRenewalPage({super.key});

  @override
  State<FEIRenewalPage> createState() => _FEIRenewalPageState();
}

class _FEIRenewalPageState extends State<FEIRenewalPage> {
  final service = Get.put(ServiceController());

  @override
  void dispose() {
    service.clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar2(
            title: 'Add FEI',
          ),
          preferredSize: Size.fromHeight(69),
        ),
        body: GetBuilder(
            init: service,
            builder: (_) {
              return ListView(
                children: [
                  SelectedHorseWidget(),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text("Add Details",
                        style: Get.textTheme.bodyLarge!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: 16),
                  MyInputShadow(
                      title: "Date",
                      widget: InkWell(
                        onTap: service.dateDialogOpen,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 50,
                          width: Get.width,
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "${service.today.day}-${months[service.today.month - 1]}-${service.today.year}"),
                        ),
                      )),
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
                          child: service.nextDate != null
                              ? Text(
                                  "${service.nextDate!.day}-${months[service.nextDate!.month - 1]}-${service.nextDate!.year}")
                              : Text(
                                  "${service.today.day}-${months[service.today.month - 1]}-${service.today.year}"),
                        ),
                      )),
                  SizedBox(height: 20),
                  service.file != null
                      ? Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          child: Image.file(service.file!),
                        )
                      : Container(
                          margin: EdgeInsets.only(left: 12),
                          child: InkWell(
                            onTap: service.imagePicker,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Container(
                                  width: 160,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(23, 34, 34, 1),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add),
                                      Text("Add Attachments"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  SizedBox(height: 30),
                  service.state
                      ? Container(
                          child: AnimatedLoadingSideWaySurge(
                            expandWidth: 70,
                            borderColor: baseColor,
                            speed: Duration(milliseconds: 600),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          child: GestureDetector(
                            onTap: () => service.saveServiceData(
                                type: "FEI",
                                recordType: ServiceTypeHelper.renewals),
                            child: Container(
                              height: 55,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: baseColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("Save",
                                  style: Get.theme.textTheme.labelMedium),
                            ),
                          ),
                        ),
                  SizedBox(height: 50),
                ],
              );
            }),
      ),
    );
  }
}
