import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/user_controler.dart';
import '../../widgets/text_positions.dart';
import '../HomeScreen/bottom_nav_bar.dart';
import '../customs/auth_pages_share_widget.dart';
import '../customs/custom_button.dart';
import 'forgot_password.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final user = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: user,
      builder: (_) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: AuthPagesShareWidget(
                  textOne: 'Welcome',
                  textTwo: 'Sign in to continue',
                  children: [
                    MyText.text("Email"),
                    SizedBox(height: 15.h),
                    TextFormField(
                      controller: user.rPassword,
                      decoration: InputDecoration(
                          hintText: "Adamsmith@gmail.com"
                      ),
                    ),
                    SizedBox(height: 20.h),
                    MyText.text("Password"),
                    SizedBox(height: 15.h),
                    TextFormField(
                      controller: user.rPassword,
                      decoration: InputDecoration(
                          hintText: "*********",
                         suffixIcon: Icon(Icons.visibility_off_outlined),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Row(
                          children: [
                            Checkbox(
                              value: user.rememberMe,
                              onChanged: user.changeRememberMe,
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
                        Get.to(() => BottomNavSheetScreen());
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
                          style: Get.textTheme.labelMedium,
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
                            SizedBox(width: 6),
                            Text('Facebook', style: Get.textTheme.labelMedium),
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
                            SizedBox(width: 6),
                            Text('Google', style: Get.textTheme.labelMedium),
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
                            style: Get.textTheme.labelMedium,
                          ),
                          TextButton(
                            onPressed: () =>  Get.to(() => SignUpScreen()),
                            child: Text(
                              'Sign Up',
                              style: Get.textTheme.labelMedium,
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
    );
  }
}
