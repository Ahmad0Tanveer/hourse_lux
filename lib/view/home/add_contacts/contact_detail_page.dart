import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/models/contact_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constant/assets.dart';

class ContactDetailPage extends StatefulWidget {
  final ContactModel contact;
  const ContactDetailPage({super.key,required this.contact});
  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget ownedHorses(){
      return  Container(
        margin: EdgeInsets.only(left: 16,right: 16,top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Owned Horses".toUpperCase(),style:Get.textTheme.bodyMedium!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            )),
            SizedBox(height: 10),
            Image.asset(
              h1,
              height: 39,
              width: 39,
            ),
            SizedBox(height: 6),
            Container(
              width: 60,
              alignment: Alignment.centerLeft,
              child: Text("Harry",style:Get.textTheme.bodyMedium!.copyWith(
                fontSize: 12,
              )),),
            SizedBox(height: 6),
            Container(height: 1,color: Color(0xffD7D7D7),),
          ],
        ),
      );
    }
    var titleStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: baseColor,
    );
    Widget rowText(n,b){
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Text(n,style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: baseColor,
            ),),
            Text(b,style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Color(0xff636363),
            ),),
          ],
        ),
      );
    }
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 250,
            color: baseColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text("${widget.contact.firstName} ${widget.contact.lastName}",style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),),

                Text("${widget.contact.contactType}",style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),),
                SizedBox(height: 10),

              ],
            ),
          ),
          SizedBox(height: 16),
          ownedHorses(),
          SizedBox(height: 12),
          Container(
            margin: EdgeInsets.only(left: 16,right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 34),
                Text("Contact Information".toUpperCase(),style: titleStyle),
                SizedBox(height: 24),
                Row(
                  children: [
                    Container(
                      width: Get.width - 100,
                      child: rowText("PRIMARY PHONE: ", "${widget.contact.primaryPhone}"),
                    ),
                    InkWell(
                      onTap: () async {
                        final Uri callLaunchUri = Uri(
                          scheme: 'tel',
                          path: '${widget.contact.primaryPhone}',
                        );
                        if (!await launchUrl(callLaunchUri)) {
                          throw Exception('Could not launch');
                        }
                      },
                      child: Icon(Icons.phone),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                        onTap: () async {
                          final Uri smsLaunchUri = Uri(
                            scheme: 'sms',
                            path: '${widget.contact.primaryPhone}',
                          );
                          if (!await launchUrl(smsLaunchUri)) {
                            throw Exception('Could not launch');
                          }
                        },
                        child: Icon(Icons.message)),
                  ],
                ),
                SizedBox(height: 16),
                rowText("Email: ", "${widget.contact.email}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
