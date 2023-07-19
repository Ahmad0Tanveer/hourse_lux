import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/view/on_boarding_screens/on_boarding_screens.dart';
import '../customs/auth_pages_share_widget.dart';
import '../customs/cusotm_text_field_with_text.dart';
import '../customs/custom_button.dart';
import '../forgot_password/forgot_password.dart';
import '../reset_password_screen/reset_password_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    bool rememberMe = false;
    bool value = false;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AuthPagesShareWidget(
              textOne: 'Welcome',
              textTwo: 'Sign in to continue',
              children: [
                CustomTextField(
                  height: 60.h,
                  width: double.infinity,
                  backgroundColor: whiteColor,
                  hintText: 'Adamsmith@gmail.com',
                  text: 'Email',
                ),
                SizedBox(height: 20.h),
                // please add the remember me checkbox here

                CustomTextField(
                  height: 60.h,
                  width: double.infinity,
                  backgroundColor: whiteColor,
                  hintText: '*********',
                  text: 'Password',
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
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
                    onPressed: () {
                      Get.to(() => ForgotPasswordScreen());
                    },
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
                  text: 'Sign In',
                  press: () {
                    Get.to(() => OnboardingScreens());
                  },
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
                SizedBox(height: 40.h),
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
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
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
                          Get.to(() => SignUpScreen());
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontFamily: 'SOURCE SANS PRO',
                              color: buttonFourColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
