import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import '../customs/auth_pages_share_widget.dart';
import '../customs/cusotm_text_field_with_text.dart';
import '../customs/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    bool value = false;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AuthPagesShareWidget(
              textOne: 'Create account,',
              textTwo: 'Sign up to get started',
              children: [
                CustomTextField(
                  height: 60.h,
                  width: double.infinity,
                  backgroundColor: whiteColor,
                  hintText: 'Name',
                  text: 'Name',
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  height: 60.h,
                  width: double.infinity,
                  backgroundColor: whiteColor,
                  hintText: 'Email',
                  text: 'Email',
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  height: 60.h,
                  width: double.infinity,
                  backgroundColor: whiteColor,
                  hintText: 'PhoneNumber',
                  text: 'PhoneNumber',
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  height: 60.h,
                  width: double.infinity,
                  backgroundColor: whiteColor,
                  hintText: '*********',
                  text: 'Password',
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  height: 60.h,
                  width: double.infinity,
                  backgroundColor: whiteColor,
                  hintText: '*********',
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
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontFamily: 'SOURCE SANS PRO',
                          color: whiteColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                DefaultButton(
                  text: 'Sign Up',
                  press: () {},
                  textColor: blackColor,
                  borderRadius: 60.r,
                  horizontalPadding: 20.w,
                  fontsize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20.h),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Or Continue with',
                      style: TextStyle(
                          fontFamily: 'SOURCE SANS PRO',
                          color: whiteColor,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          facebookLogo,
                          width: 25.w,
                          height: 25.h,
                        ),
                        Text('Facebook',
                            style: TextStyle(
                                fontFamily: 'SOURCE SANS PRO',
                                color: whiteColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 50.w),
                    Row(
                      children: [
                        Image.asset(
                          googleLogo,
                          width: 25.w,
                          height: 25.h,
                        ),
                        Text('Google',
                            style: TextStyle(
                                fontFamily: 'SOURCE SANS PRO',
                                color: whiteColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                          fontFamily: 'SOURCE SANS PRO',
                          color: whiteColor,
                          fontSize: 16.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontFamily: 'SOURCE SANS PRO',
                            color: buttonFourColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
