import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/user_controler.dart';
import 'package:hourse_lux/view/customs/custom_text.dart';
import 'package:pinput/pinput.dart';
import '../customs/auth_pages_share_widget.dart';
import '../customs/custom_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool value = false;
  final user = Get.put(UserController());
  int seconds = 50;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(seconds > 0){
          seconds--;
        } else {
          seconds = 0;
        }
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(13),
      color: Colors.white,
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return GetBuilder(
      init: user,
      builder: (_) => Scaffold(
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
                      text: 'Code has been send to ${user.email.text}'),
                  SizedBox(height: 80.h),
                  Pinput(
                    controller: user.opt,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => print(pin),
                  ),
                  SizedBox(height: 30.h),
                  seconds>0?  CustomText(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      text: 'Resend code in ${seconds} s'):
              user.state?  Container(
                child: CircularProgressIndicator(),
              ) :  GestureDetector(
                    onTap: user.verifyOtp,
                    child: CustomText(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        text: 'Resend code in ${seconds} s'),
                  ),
                  SizedBox(height: 150.h),
                  DefaultButton(
                    text: 'Verify',
                    press: user.verifyOtp,
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
