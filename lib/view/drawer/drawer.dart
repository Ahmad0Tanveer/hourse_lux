import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/helpers/keys.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hourse_lux/view/drawer/about_us_page.dart';
import 'package:hourse_lux/view/drawer/edit_profile.dart';
import '../../core/constant/assets.dart';
import '../../core/constant/colors.dart';
import '../../main.dart';
import '../../widgets/styles.dart';
import '../accounts/login_screen.dart';
import '../customs/custom_button.dart';
import 'contact_us_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget myWidget(title,icon,onPressed){
      return Container(
        child:  ListTile(
          onTap: onPressed,
          leading: Icon(icon,color: Colors.white),
          title: Text(title,style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),),
        ),
      );
    }
    return Drawer(
      backgroundColor: darkBlueColor,
      child: SafeArea(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Image.asset(
                appLogo2,
                width: 161,
              ),
            ),
            SizedBox(height: 40),
            myWidget("Profile",Icons.person_2,() => Get.to(() => EditProfileSection())),
            myWidget("Subscription",Icons.replay_rounded,() => Get.to(() => EditProfileSection())),
            myWidget("About",Icons.info_outline,() => Get.to(() => AboutUsPage())),
            myWidget("Contact Us",Icons.contact_page_outlined,() => Get.to(() => ContactUsPage())),
            myWidget("Logout",Icons.logout,handleLogout),
          ],
        ),
      ),
    );
  }
  void handleLogout(){
    //Get.back();
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        enableDrag: true,
        shape: HelperStyles.sheetShape,
        backgroundColor: baseColor,
        builder: (context) {
          return Container(
            height: 304,
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Container(
                    width: 48,
                    height: 4,
                    margin: EdgeInsets.only(left: 16,right: 16),
                    color: Colors.grey,
                  ),
                  SizedBox(height: 32),
                  Text("Logout",style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),),
                  SizedBox(height: 16),
                  Container(
                    width: Get.width,
                    height: 1,
                    margin: EdgeInsets.only(left: 16,right: 16),
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text("Are you sure you want to log out ?",style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  )),
                  SizedBox(height: 32),
                  DefaultButton(
                    text: 'Logout',
                    press: handleLogoutButton,
                    textColor: blackColor,
                    borderRadius: 60.r,
                    horizontalPadding: 20.w,
                    fontsize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 16),
                  DefaultButton(
                    text: 'Cancel',
                    press: () => Get.back(),
                    textColor: blackColor,
                    borderRadius: 60.r,
                    horizontalPadding: 20.w,
                    fontsize: 16.sp,
                    gradientColors: [
                      Colors.white,
                      Colors.white,
                    ],
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  void handleLogoutButton() async{
    await box.remove(allKeys.userMap);
    Get.offAll(() => SignInScreen());
  }
}
