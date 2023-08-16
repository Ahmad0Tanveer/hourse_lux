import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/helpers/enums_herlper.dart';
import 'package:hourse_lux/core/helpers/herlper_dialogs.dart';
import 'package:hourse_lux/core/helpers/keys.dart';
import 'package:hourse_lux/main.dart';
import '../view/HomeScreen/bottom_nav_bar.dart';
import '../view/accounts/forgot_password.dart';
import 'api_service_controller.dart';

class UserController extends GetxController {
  bool state = false;
  final service = ApiService();
  final loginForm = GlobalKey<FormState>();
  final resetPassword = GlobalKey<FormState>();
  final signUpForm = GlobalKey<FormState>();
  final forgetPasswordForm = GlobalKey<FormState>();
  var phone = TextEditingController();
  var email = TextEditingController();
  var name = TextEditingController();
  var password = TextEditingController();
  var rPassword = TextEditingController();
  var opt = TextEditingController();
  bool rememberMe = false;
  void initAuth() async {

  }
  void initPres() {
    if(box.read(allKeys.rememberMe)??false){
      email.text = box.read(allKeys.email)??"";
      password.text = box.read(allKeys.password)??"";
      rememberMe = box.read(allKeys.rememberMe)??false;
      update();
    }
  }
  void handleLogin() async {
    state = true;
    update();
    if (loginForm.currentState!.validate()) {
      if(box.read(allKeys.rememberMe)??false){
        await box.write(allKeys.email, email.text);
        await box.write(allKeys.password, password.text);
      }
      Map<String,dynamic> userMap = {
        "email": email.text,
        "password": password.text,
      };
      final out = await service.request(endPoint: "user-singin",body: userMap,type: RequestType.post);
      print(out.body);
      print(out.statusCode);
      if(out.statusCode == 200){
        Map data = jsonDecode(out.body);
        await box.write(allKeys.userMap, data);
        Get.to(() => BottomNavSheetScreen());
      }else {
        HelperDialog.errorDialog("", "Check Email/Password");
      }
    }
    state = false;
    update();
  }

  void handleSignUp() async {
    state = true;
    update();
    if (signUpForm.currentState!.validate()) {
      Map<String,dynamic> userMap = {
        "name": name.text,
        "email": email.text,
        "phoneNumber": phone.text,
        "password": password.text,
        "confirmPassword": password.text,
      };
      final out = await service.request(endPoint: "user",body: userMap,type: RequestType.post);
      if(out.statusCode == 409){
         HelperDialog.errorDialog("Account Exits", "Email already exists. Please choose a different email");
        //
      }else if(out.statusCode == 200){
        Map data = jsonDecode(out.body);
        await box.write(allKeys.userMap, data);
        Get.to(() => BottomNavSheetScreen());
      }else {
        HelperDialog.errorDialog("Ohh", "Some thing went wrong");
      }
    }
    state = false;
    update();
  }

  void handleForgotPassword() async {
    state = true;
    update();
    try{
      if (forgetPasswordForm.currentState!.validate()) {
        Map<String,dynamic> userMap = {
          "email": email.text,
        };
        final out = await service.request(endPoint: "forgot-password",body: userMap,type: RequestType.post);
        if(out.statusCode == 404){
          state = true;
          update();
          HelperDialog.errorDialog("Account Not Exits", "User detail not found");
        }else if(out.statusCode == 200){
          state = true;
          update();
          HelperDialog.nbToast("OTP sent successfully");
          Get.to(() => ForgotPasswordScreen());
        }else {
          state = true;
          update();
          HelperDialog.errorDialog("Ohh", "Some thing went wrong");
        }
      }
    }catch(e){}
    state = true;
    update();
  }
  void changeRememberMe(state) async {
    rememberMe = state;
    update();
    await box.write(allKeys.rememberMe, state);
  }
  void verifyOtp() async {
    state = true;
    try{
      if(opt.text.isNotEmpty){
        Map<String,dynamic> userMap = {
          "email": email.text,
        };
        final out = await service.request(endPoint: "verify-otp",body: userMap,type: RequestType.post);
        print(out.body);
        /*if(out.statusCode == 404){
          state = true;
          update();
          HelperDialog.errorDialog("Account Not Exits", "User detail not found");
        }else if(out.statusCode == 200){
          state = true;
          update();
          HelperDialog.nbToast("OTP sent successfully");
          Get.to(() => ForgotPasswordScreen());
        }else {
          state = true;
          update();
          HelperDialog.errorDialog("Ohh", "Some thing went wrong");
        }*/
      }
    } catch(e){}
    update();
    state = false;
    update();
  }
  void handleGoogleSignUp() async {}
  void handleSignOut() async {}
}
