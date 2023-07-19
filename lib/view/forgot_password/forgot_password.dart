import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/view/customs/custom_text.dart';
import 'package:hourse_lux/view/reset_password_screen/reset_password_screen.dart';
import '../customs/auth_pages_share_widget.dart';
import '../customs/cusotm_text_field_with_text.dart';
import '../customs/custom_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    bool value = false;
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
                Row(
                  children: List.generate(
                      4,
                      (index) => Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: CustomTextField(
                                height: 70.h,
                                width: 83.w,
                                backgroundColor: whiteColor,
                                hintText: '',
                                text: ''),
                          )),
                ),
                SizedBox(height: 50.h),
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
