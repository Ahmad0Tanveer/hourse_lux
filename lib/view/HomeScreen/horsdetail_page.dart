import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorseDetailPage extends StatefulWidget {
  const HorseDetailPage({super.key});
  @override
  State<HorseDetailPage> createState() => _HorseDetailPageState();
}

class _HorseDetailPageState extends State<HorseDetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget horseAppBar(){
      return Container(
        height: 230,
        width: Get.width,
        child: Stack(
          children: [
            Container(
                height: 230,
                width: Get.width,
            )
          ],
        ),
      );
    }
    return Scaffold(
      body: ListView(
        children: [
          horseAppBar(),
        ],
      ),
    );
  }
}
