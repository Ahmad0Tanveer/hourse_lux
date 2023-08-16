import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/assets.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/user_controler.dart';
import '../../core/helpers/validdation_helper.dart';
import '../../widgets/text_positions.dart';
import '../customs/auth_pages_share_widget.dart';
import '../customs/custom_button.dart';
import 'forget_password_input_email_page.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final user = Get.put(UserController());
  @override
  void initState() {
    user.initPres();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: user,
      builder: (_) {
        return Scaffold(
          body: Form(
            key: user.loginForm,
            child: Column(
              children: [
                Expanded(
                  child: AuthPagesShareWidget(
                    textOne: 'Welcome,',
                    textTwo: 'Sign in to continue',
                    children: [
                      MyText.text("Email"),
                      SizedBox(height: 15.h),
                      TextFormField(
                        controller: user.email,
                        validator: ValidationHelpers.emailValidator,
                        decoration: InputDecoration(
                            hintText: "Adamsmith@gmail.com"
                        ),
                      ),
                      SizedBox(height: 20.h),
                      MyText.text("Password"),
                      SizedBox(height: 15.h),
                      TextFormField(
                        controller: user.password,
                        validator: ValidationHelpers.passwordValidator,
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
                          onPressed: () => Get.to(() => ForgetPasswordPasswordInputEmail()),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    user.state? Container(
                      child: CircularProgressIndicator(),
                    ) :DefaultButton(
                        text: 'Sign In',
                        press: user.handleLogin,
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
                      SizedBox(height: 30.h),
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
                                style: Get.textTheme.labelMedium!.copyWith(
                                  color: Color(0xffE2BD5A),
                                ),
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
          ),
        );
      }
    );
  }
}
