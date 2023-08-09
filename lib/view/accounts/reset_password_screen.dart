import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/user_controler.dart';
import 'package:hourse_lux/view/accounts/login_screen.dart';
import 'package:hourse_lux/widgets/text_positions.dart';
import '../customs/auth_pages_share_widget.dart';
import '../customs/custom_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final user = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    bool value = false;
    return Scaffold(
      body: Form(
        key: user.resetPassword,
        child: Column(
          children: [
            Expanded(
              child: AuthPagesShareWidget(
                textOne: 'Reset password',
                textTwo: 'Create a new password',
                children: [
                  MyText.text("New Password"),
                  SizedBox(height: 15.h),
                  TextFormField(
                    controller: user.password,
                    decoration: InputDecoration(
                      hintText: "NewPassword"
                    ),
                  ),

                  SizedBox(height: 15.h),
                  MyText.text("Confirm New Password"),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: user.rPassword,
                    decoration: InputDecoration(
                        hintText: "ConfirmPassword"
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
      ),
    );
  }
}
