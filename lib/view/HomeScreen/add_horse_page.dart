import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/models/ui/add_home_model.dart';
import 'package:hourse_lux/widgets/custom_appbar.dart';
import 'package:hourse_lux/widgets/styles.dart';

import 'home_screen.dart';

class AddHorsePage extends StatefulWidget {
  const AddHorsePage({super.key});
  @override
  State<AddHorsePage> createState() => _AddHorsePageState();
}

class _AddHorsePageState extends State<AddHorsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: ListView(
        children: [
          CustomAppBar(),
          Wrap(
            children: allAddData.map((e) => Container(
              margin: EdgeInsets.only(top: 20),
              width: Get.width,
              child: Column(
                children: [
                  Text("${e.title}",style: Get.theme.textTheme.labelLarge),
                  SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: e.menus.map((m) => GestureDetector(
                      onTap: () {
                        if(!m.bottomSheet){
                          Get.to(() => m.page);
                        } else {
                          showModalBottomSheet(
                              context: Get.context!,
                              isScrollControlled: true,
                              enableDrag: true,
                              shape: HelperStyles.sheetShape,
                              backgroundColor: baseColor,
                              builder: (context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height * 0.9,
                                  child: m.page,
                                );
                              }
                          );
                        }
                      },
                      child: Container(
                        height: 80,
                        width: 100,
                        child: Column(
                          children: [
                            Image.asset(m.image,height: 32,width: 32,),
                            SizedBox(height: 12),
                            Text(m.name,style: Get.theme.textTheme.labelLarge!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )).toList(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    color: Colors.grey,
                    height: 1,
                  ),
                ],
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
