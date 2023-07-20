import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/user_controler.dart';
import '../../widgets/text_positions.dart';
import '../customs/auth_pages_share_widget.dart';
import '../customs/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final user = Get.put(UserController());
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
                MyText.text("Name"),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: user.rPassword,
                  decoration: InputDecoration(
                      hintText: "Name"
                  ),
                ),

                SizedBox(height: 20.h),
                MyText.text("Email"),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: user.rPassword,
                  decoration: InputDecoration(
                      hintText: "Email"
                  ),
                ),
                SizedBox(height: 20.h),
                MyText.text("Phone Number"),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: user.rPassword,
                  decoration: InputDecoration(
                      hintText: "PhoneNumber"
                  ),
                ),
                SizedBox(height: 20.h),
                MyText.text("Password"),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: user.rPassword,
                  decoration: InputDecoration(
                      hintText: "*********"
                  ),
                ),

                SizedBox(height: 20.h),
                MyText.text("Confirm Password"),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: user.rPassword,
                  decoration: InputDecoration(
                      hintText: "*********"
                  ),
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
                          style: Get.textTheme.labelMedium!.copyWith(color: Colors.white),
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
