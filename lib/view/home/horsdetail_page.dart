import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/horse_controller.dart';
import 'package:hourse_lux/models/horse_model.dart';
import 'package:hourse_lux/models/ui/home_page_bar.dart';

import 'update/update_horse_page.dart';

class HorseDetailPage extends StatefulWidget {
  final HorseModel horse;

  const HorseDetailPage({super.key, required this.horse});

  @override
  State<HorseDetailPage> createState() => _HorseDetailPageState();
}

class _HorseDetailPageState extends State<HorseDetailPage> {
  final horseC = Get.put(HorseController());
  DetailTabBar selectedBar = bars[0];

  void changeBar(bar) {
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
    Widget popWidget() {
      return SafeArea(
        child: Container(
          child: PopupMenuButton(
            onSelected: (val){
              if(val == 'delete'){
                horseC.deleteHorse(widget.horse.sId);
              } else{
                Get.to(() => UpdateHorsePage(model: horseC.details));
              }
            },
            child: Icon(Icons.more_vert, color: Colors.white, size: 25),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "edit",
                    child: Row(children: [
                      Icon(Icons.edit, size: 22),
                      SizedBox(width: 10),
                      Text("Edit"),
                  ],
                )),
                PopupMenuItem(
                  value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline, size: 22),
                        SizedBox(width: 10),
                        Text("Delete"),
                      ],
                    )
                ),
              ];
            },
          ),
        ),
      );
    }

    Widget horseAppBar() {
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
                top: 24,
                child: Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Text(
                    widget.horse.neckName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Owner: ${widget.horse.owner}", style: style),
                    SizedBox(height: 10),
                    Text("Billpayer: ${widget.horse.billPayer}", style: style),
                    SizedBox(height: 10),
                    Text("Microchip: ${widget.horse.microchip}", style: style),
                    SizedBox(height: 10),
                    Text("${widget.horse.bread}", style: style),
                    SizedBox(height: 10),
                  ],
                )),
            Positioned(
              right: 10,
              top: 10,
              child: popWidget(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          horseAppBar(),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: bars.map((e) {
                bool active = selectedBar.title == e.title;
                return InkWell(
                  onTap: () => changeBar(e),
                  child: Container(
                    height: 31,
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: active ? baseColor : Colors.transparent,
                    ),
                    child: Text(
                      e.title,
                      style: TextStyle(
                        color: active ? Colors.white : Color(0xff9F9F9F),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            height: 1,
            color: Color(0xffD7D7D7),
          ),
          selectedBar.widget,
        ],
      ),
    );
  }
}
