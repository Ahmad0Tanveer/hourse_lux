import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/horse_controller.dart';
import 'package:hourse_lux/core/service_controller.dart';
import 'package:hourse_lux/models/horse_model.dart';
import 'package:hourse_lux/view/customs/custom_text.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'package:hourse_lux/widgets/selected_horses_widget.dart';

class HorseSelectPage extends StatefulWidget {
  final Widget nextPage;
  final String title;
  const HorseSelectPage({super.key,required this.nextPage,required this.title});
  @override
  State<HorseSelectPage> createState() => _HorseSelectPageState();
}

class _HorseSelectPageState extends State<HorseSelectPage> {
  final service = Get.put(ServiceController());
  final horse = Get.put(HorseController());

  @override
  void initState() {
    horse.initHorses();
    super.initState();
  }
  @override
  void dispose() {
    horse.searchHorse("");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Widget myHorseWidget(HorseModel h){
      return ListTile(
        title: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: h.image,
                    height: 60.h,
                    width: 60.h,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: h.neckName,
                          fontSize: 15.sp,
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        CustomText(
                          text: "Owner:",
                          fontSize: 14.sp,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 5),
                        CustomText(
                          text:  h.owner,
                          fontSize: 14.sp,
                          color: greyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () =>  service.selectHorse(h),
                    icon:   Container(
                      height: 20,
                      width: 20,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(color: baseColor,width: 1),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: service.selectedHorse != null && service.selectedHorse!.sId==h.sId?baseColor:Colors.transparent
                        ),
                      ),
                    ),
                )
              ],
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(
                thickness: 1,
                color: greyColor.withOpacity(0.5),
              ),
            )
          ],
        ),
        // Add more customization or widgets as needed for each item
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(child: CustomAppBar2(title: widget.title)),
        preferredSize: Size.fromHeight(63),
      ),
      body: GetBuilder(
          init: service,
          builder: (_) {
            return Stack(
              children: [
                GetBuilder(
                    init: horse,
                    builder: (_) {
                      return Container(
                        height: Get.height,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            service.selectedHorse !=null?  SelectedHorseWidget():Container(
                              height: 0.01,
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(left: 10,right: 10),
                              height: 50,
                              child: TextField(
                                onChanged: horse.searchHorse,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: Color.fromRGBO(223, 226, 232,1),
                                  filled: true,
                                  hintText: "Search",
                                  suffixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Wrap(
                              children: horse.horses.map((e) =>  myHorseWidget(e)).toList(),
                            ),
                          ],
                        ),
                      );
                    }
                ),
                service.selectedHorse !=null?  Positioned(
                  bottom: 10,
                  child:  Container(
                    margin: EdgeInsets.only(left: 16,right: 16),
                    child: GestureDetector(
                      onTap: () => Get.to(widget.nextPage),
                      child: Container(
                        height: 55,
                        width: Get.width - 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: baseColor,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("Next",style: Get.theme.textTheme.labelMedium),
                      ),
                    ),
                  ),):Container()
              ],
            );
          }
      ),
    );
  }
}
