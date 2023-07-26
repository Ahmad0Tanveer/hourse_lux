import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/view/HomeScreen/add_horses/herse_select_page.dart';
import 'package:hourse_lux/view/HomeScreen/renewal_pages/coggins_renewal_page.dart';
import 'package:hourse_lux/view/HomeScreen/renewal_pages/passport_renewal_page.dart';
import 'package:hourse_lux/widgets/custom_appbar_2.dart';
import 'FEI_renewal_page.dart';
import 'lease_renewal_page.dart';

class RenewalTypesPage extends StatelessWidget {
  const RenewalTypesPage({super.key});
  @override
  Widget build(BuildContext context) {
    Widget textDraw(image,text,next,title){
      return InkWell(
        onTap: () => Get.to(HorseSelectPage(nextPage: next, title: title)),
        child: Container(
          margin: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            children: [
              SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        width: 39,
                        height: 39,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black,width: 1),
                        ),
                        child: Image.asset(image),
                      ),
                      SizedBox(width: 10),
                      Text(text),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded,size: 20),
                ],
              ),
              SizedBox(height: 10),
              Container(height: 1,color: Color(0xffD7D7D7),)
            ],
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: CustomAppBar2(title: 'Choose Record Type',),
          preferredSize: Size.fromHeight(69),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text("Choose A Renewal Record Type",style: Get.textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              )),
            ),
            textDraw("assets/record_type/tube.png","Coggins",CogginsRenewalPage(),"Add Coggins Renewal"),
            textDraw("assets/record_type/FEI.png","FEI",FEIRenewalPage(),"Add FEI Renewal"),
            textDraw("assets/record_type/contract1.png","Lease",LeaseRenewalPage(),"Add Lease Renewal"),
            textDraw("assets/record_type/passport.png","Passport",PassportRenewalPage(),"Add Passport Renewal"),
          ],
        ),
      ),
    );
  }
}
