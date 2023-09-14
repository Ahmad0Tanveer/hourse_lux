import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/helpers/validdation_helper.dart';
import 'package:hourse_lux/core/user_controler.dart';
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
  bool secure = true;
  void changeState(){
    setState(() {
      secure = !secure;
    });
  }
  @override
  Widget build(BuildContext context) {
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
                    obscureText: secure,
                    controller: user.password,
                    validator: ValidationHelpers.passwordValidator,
                    decoration: InputDecoration(
                      hintText: "New Password",
                      suffixIcon: IconButton(
                        icon: secure?Icon(Icons.visibility):Icon(Icons.visibility_off_outlined),
                        onPressed: changeState,
                      ),
                    ),
                  ),

                  SizedBox(height: 15.h),
                  MyText.text("Confirm New Password"),
                  SizedBox(height: 10.h),
                  TextFormField(
                    obscureText: secure,
                    controller: user.rPassword,
                    validator: (_){
                      if(user.password.text != user.rPassword.text){
                        return "Password Not Matched";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
                      suffixIcon: IconButton(
                        icon: secure?Icon(Icons.visibility):Icon(Icons.visibility_off_outlined),
                        onPressed: changeState,
                      ),
                    ),
                  ),

                  SizedBox(height: 100.h),
                  user.state?  Container(
                    child: CircularProgressIndicator(),
                  ): DefaultButton(
                    text: 'Save',
                    press: user.updatePasswordRequest,
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
