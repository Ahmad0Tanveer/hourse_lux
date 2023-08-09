import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/view/customs/custom_text.dart';
import 'package:hourse_lux/view/accounts/reset_password_screen.dart';
import '../customs/auth_pages_share_widget.dart';
import '../customs/custom_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AuthPagesShareWidget(
              textOne: 'Forget password',
              textTwo: '',
              children: [
                SizedBox(height: 80.h),
                CustomText(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: whiteColor.withOpacity(0.7),
                    text: 'Code has been send to adam*******@gmail.com'),
                SizedBox(height: 80.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) => Container(
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: false,
                        border: InputBorder.none,
                      ),
                    ),
                  )),
                ),
                SizedBox(height: 30.h),
                CustomText(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    text: 'Resend code in 56 s'),
                SizedBox(height: 150.h),
                DefaultButton(
                  text: 'Varify',
                  press: () {
                    Get.to(() => ResetPasswordScreen());
                  },
                  textColor: blackColor,
                  borderRadius: 60.r,
                  horizontalPadding: 20.w,
                  fontsize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
