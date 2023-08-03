import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageActivityWidget extends StatefulWidget {
  const HomePageActivityWidget({super.key});
  @override
  State<HomePageActivityWidget> createState() => _HomePageActivityWidgetState();
}

class _HomePageActivityWidgetState extends State<HomePageActivityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
            width: Get.width,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16),
            child: Text("Monday, 24, JUNE, 2023",style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {},
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 16),
                  Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black,width: 1)
                      ),
                      child: Image.asset("assets/record_type/deworm1.png",width: 36,height: 36,color: Colors.black,)),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("anthelcide eq - oxidendalzole",style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),),
                      Text("Deworing 400",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff636363)
                      ),),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_sharp),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(height: 1,color: Color(0xffD7D7D7),),
          SizedBox(height: 30),
          Container(
            width: Get.width,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16),
            child: Text("Monday, 24, JUNE, 2023",style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {},
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 16),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black,width: 1)
                      ),
                      child: Image.asset("assets/icons/easy-installation.png",width: 33,height: 33,color: Colors.black,)),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bodyclip",style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),),
                      Text("Service Record - \$120",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff636363)
                      ),),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_sharp),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(height: 1,color: Color(0xffD7D7D7),),
          SizedBox(height: 24),
          InkWell(
            onTap: (){},
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 16),
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black,width: 1)
                      ),
                      child: Image.asset("assets/record_type/tube.png",width: 42,height: 42,)),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Coggins Renewal - Harry",style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),),
                      Text("Coggins",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff636363)
                      ),),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_sharp),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(left: 32,right: 32),
            height: 1,color: Color(0xffD7D7D7),),
        ],
      ),
    );
  }
}
