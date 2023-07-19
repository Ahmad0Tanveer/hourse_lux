import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/view/sign_in_screen/sign_in_screen.dart';
import '../customs/auth_pages_share_widget.dart';
import '../customs/cusotm_text_field_with_text.dart';
import '../customs/custom_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    bool value = false;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AuthPagesShareWidget(
              textOne: 'Reset password',
              textTwo: 'Create a new password',
              children: [
                CustomTextField(
                  height: 60.h,
                  width: double.infinity,
                  backgroundColor: whiteColor,
                  hintText: 'NewPassword',
                  text: 'NewPassword',
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  height: 60.h,
                  width: double.infinity,
                  backgroundColor: whiteColor,
                  hintText: 'ConfirmPassword',
                  text: 'ConfirmPassword',
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
                SizedBox(height: 20.h),
                //i want to check the remember me checkbox here
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: whiteColor,
                          checkColor: whiteColor,
                          value: value,
                          onChanged: (bool? newValue) {
                            setState(() {
                              value = newValue!;
                            });
                          },
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                              fontFamily: 'SOURCE SANS PRO',
                              color: whiteColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100.h),
                DefaultButton(
                  text: 'Save',
                  press: () {
                    Get.to(() => SignInScreen());
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
