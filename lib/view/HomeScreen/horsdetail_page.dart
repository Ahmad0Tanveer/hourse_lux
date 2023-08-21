import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/models/horse_model.dart';
import 'package:hourse_lux/models/ui/home_page_bar.dart';

class HorseDetailPage extends StatefulWidget {
  final HorseModel horse;
  const HorseDetailPage({super.key,required this.horse});
  @override
  State<HorseDetailPage> createState() => _HorseDetailPageState();
}

class _HorseDetailPageState extends State<HorseDetailPage> {


  DetailTabBar selectedBar = bars[0];
  void changeBar(bar){
    selectedBar = bar;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    );
    Widget horseAppBar(){
      return Container(
        height: 230,
        width: Get.width,
        child: Stack(
          children: [
            Container(
                height: 230,
                width: Get.width,
              child: CachedNetworkImage(
                imageUrl: widget.horse.image,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Owner: ${widget.horse.owner}",style: style),
                    SizedBox(height: 10),
                    Text("Billpayer: ${widget.horse.billPayer}",style: style),
                    SizedBox(height: 10),
                    Text("Microchip: ${widget.horse.microchip}",style: style),
                    SizedBox(height: 10),
                    Text("${widget.horse.bread}",style: style),
                    SizedBox(height: 10),
                  ],
                ))
          ],
        ),
      );
    }
    return Scaffold(
      body: ListView(
        children: [
          horseAppBar(),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(left: 16,right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: bars.map((e) {
                bool active = selectedBar.title == e.title;
                return InkWell(
                  onTap: () => changeBar(e),
                  child: Container(
                    height: 31,
                    padding: EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: active?baseColor:Colors.transparent,
                    ),
                    child: Text(e.title,style: TextStyle(
                      color: active? Colors.white :Color(0xff9F9F9F),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),),
                  ),
                );
              }).toList(),
            ),
          ),
          selectedBar.widget,
        ],
      ),
    );
  }
}





