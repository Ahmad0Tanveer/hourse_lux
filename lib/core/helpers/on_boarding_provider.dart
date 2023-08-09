import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/main.dart';
import 'package:hourse_lux/models/ui/boarding_model.dart';
import '../constant/assets.dart';
import '../../view/accounts/login_screen.dart';
import './keys.dart';

class OnBoardingProvider extends GetxController {
  var controller  = PageController();
  int currentIndex = 0;
  List<BoardingModel> boardings = [
    BoardingModel(title: "Horse Management",image: onboardingOne,description: "'Log medical conditions, medications, rides, farrier or veterinary activities and much more'"),
    BoardingModel(title: "Grooming your horse",image: onboardingTwo,description: 'You need to purchase grooming items to groom your horse. Grooming is an integral part of horse care.'),
    BoardingModel(title: "PLANNING & REMINDERS",image: onboardingThree,description: "Visual alerts and reminders Track and prepare for your next foal"),
    BoardingModel(title: "PLANNING & REMINDERS",image: onboardingFour,description: "Track lifetime costs associated with your horse Customizable reports at the tip of your fingers"),
  ];
  List<String> images = [onboardingOne,onboardingTwo,onboardingThree,onboardingFour];

  void changeIndex() async {
    if (currentIndex < 3) {
      currentIndex = currentIndex + 1;
      controller.jumpToPage(currentIndex);
      update();
    } else {
      await box.write(allKeys.boardingScreen, true);
      Get.offAll(() => SignInScreen());
    }
  }
  void onChanePage(index){
    currentIndex = index;
    update();
  }
}
