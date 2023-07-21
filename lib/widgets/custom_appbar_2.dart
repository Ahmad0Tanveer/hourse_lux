import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomAppBar2 extends StatefulWidget {
  final String title;
  const CustomAppBar2({super.key,required this.title});

  @override
  State<CustomAppBar2> createState() => _CustomAppBar2State();
}

class _CustomAppBar2State extends State<CustomAppBar2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: ()=> Get.back(), icon: Icon(Icons.arrow_back_ios_new)),
              Text(widget.title,
                  style: Get.theme.textTheme.labelLarge!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  )
              ),
              SizedBox(width: 50),
            ],
          ),
          SizedBox(height: 12),
          Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              height: 1.5,color: Colors.grey)
        ],
      ),
    );
  }
}
