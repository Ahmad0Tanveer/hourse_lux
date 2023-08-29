import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/service_controller.dart';
import 'package:hourse_lux/models/service_model.dart';

import '../../../core/helpers/service_type_helper.dart';

class ServicesDetailPage extends StatefulWidget {
  final ServiceModel service;
  const ServicesDetailPage({super.key,required this.service});
  @override
  State<ServicesDetailPage> createState() => _ServicesDetailPageState();
}

class _ServicesDetailPageState extends State<ServicesDetailPage> {
  final service = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    Widget detailAppBar(){
      return Container(
        height: 69,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: ()=> Get.back(), icon: Icon(Icons.arrow_back_ios_new)),
                Text((widget.service.recordType != ServiceTypeHelper.service? widget.service.recordType: widget.service.serviceType
                ).toUpperCase(),
                    style: Get.theme.textTheme.labelLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    )
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.delete_outline)
                )
              ],
            ),
            SizedBox(height: 12),
            Container(height: 1,color: Color(0xffD7D7D7),),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: detailAppBar()),
        preferredSize: Size.fromHeight(62),
      ),
      body: GetBuilder(
          init: service,
          builder: (_) {
            return ListView(
              children: [

              ],
            );
          }
      ),
    );
  }
}
