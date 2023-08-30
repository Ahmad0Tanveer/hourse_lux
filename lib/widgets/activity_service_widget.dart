
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/service_controller.dart';
import 'package:hourse_lux/models/service_model.dart';

import '../core/helpers/service_type_helper.dart';
import '../view/home/service_records/record_detail_page.dart';

class ActivityServiceWidget extends StatefulWidget {
  final ServiceModel model;
  const ActivityServiceWidget({super.key,required this.model});
  @override
  State<ActivityServiceWidget> createState() => _ActivityServiceWidgetState();
}

class _ActivityServiceWidgetState extends State<ActivityServiceWidget> {
  final service = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    String transformString(String inputStr) {
      List<String> words = inputStr.split('_');
      words = words.map((word) => word[0].toUpperCase() + word.substring(1)).toList();
      if (words.length > 1) {
        return words.join(' ');
      } else {
        return words[0];
      }
    }
    Widget subTitleText(){
      var style = TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xff636363)
      );
      if(widget.model.recordType== ServiceTypeHelper.service){
        return Text("${widget.model.serviceType} : \$${widget.model.cost}",style: style);
      }else {
        return Text("${transformString (widget.model.recordType)} ${widget.model.value}",style: style);
      }
    }
    return  InkWell(
      onTap: () {
        service.initServiceModel(widget.model);
        Get.to(() => ServicesDetailPage(service: widget.model));
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 16),
            Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black,width: 1)
                ),
                child: Image.asset(imageHelper(type: widget.model.recordType),width: 33,height: 33,color: Colors.black,)),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transformString (widget.model.recordType),style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),),
                subTitleText(),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios_sharp),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
