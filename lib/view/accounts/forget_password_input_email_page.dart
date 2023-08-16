import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/view/accounts/forgot_password.dart';
import 'package:pinput/pinput.dart';

import '../../core/constant/colors.dart';
import '../../core/helpers/validdation_helper.dart';
import '../../core/user_controler.dart';
import '../../widgets/text_positions.dart';
import '../customs/auth_pages_share_widget.dart';
import '../customs/custom_button.dart';

class ForgetPasswordPasswordInputEmail extends StatefulWidget {
  const ForgetPasswordPasswordInputEmail({super.key});
  @override
  State<ForgetPasswordPasswordInputEmail> createState() => _ForgetPasswordPasswordInputEmailState();
}

class _ForgetPasswordPasswordInputEmailState extends State<ForgetPasswordPasswordInputEmail> {
  final user = Get.put(UserController());

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
        init: user,
        builder: (_) {
          return Scaffold(
            body: Form(
              key: user.forgetPasswordForm,
              child: Column(
                children: [
                  Expanded(
                    child: AuthPagesShareWidget(
                      textOne: 'Forget Password,',
                      textTwo: 'Please enter your Email, we will send the OTP in this phone number.',
                      children: [
                        SizedBox(height: 40.h),
                        MyText.text("Email"),
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: user.email,
                          validator: ValidationHelpers.emailValidator,
                          decoration: InputDecoration(
                              hintText: "Adamsmith@gmail.com"
                          ),
                        ),
                        SizedBox(height: 30.h),
                       user.state? Container(
                         child: CircularProgressIndicator(),
                       ) :DefaultButton(
                          text: 'Verify',
                          press: user.handleForgotPassword,
                          textColor: blackColor,
                          borderRadius: 60.r,
                          horizontalPadding: 20.w,
                          fontsize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
