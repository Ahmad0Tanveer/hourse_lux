import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/helpers/keys.dart';
import 'package:hourse_lux/main.dart';

class UserController extends GetxController {
  bool state = false;
  final loginForm = GlobalKey<FormState>();
  final resetPassword = GlobalKey<FormState>();
  final signUpForm = GlobalKey<FormState>();
  final forgetPasswordForm = GlobalKey<FormState>();

  var phone = TextEditingController();
  var email = TextEditingController();
  var name = TextEditingController();
  var password = TextEditingController();
  var rPassword = TextEditingController();
  bool rememberMe = false;

  void initAuth() async {

  }
  void initPres() {
    if(box.read(allKeys.rememberMe)??false){
      email.text = box.read(allKeys.email)??"";
      password.text = box.read(allKeys.password)??"";
      update();
    }
  }
  void handleLogin() async {
    if (loginForm.currentState!.validate()) {

    }
    state = false;
    update();
  }

  void handleSignUp() async {
    if (signUpForm.currentState!.validate()) {

    }
    state = false;
    update();
  }

  void handleForgotPassword() async {
    if (forgetPasswordForm.currentState!.validate()) {}
  }
  void changeRememberMe(state){
    rememberMe = state;
    update();
  }

  void handleGoogleSignUp() async {}
  void handleSignOut() async {}
}
