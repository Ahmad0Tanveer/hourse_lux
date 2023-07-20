import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/assets.dart';
import '../../view/accounts/login_screen.dart';

class OnBoardingProvider extends GetxController {
  int currentIndex = 0;
  String currentImage = onboardingOne;
  String currentText = 'Horse Management';
  String currenTextTwo =
      'Log medical conditions, medications, rides, farrier or veterinary activities and much more';

  void changeIndex() {
    if (currentIndex < 3) {
      currentIndex++;
      switch (currentIndex) {
        case 1:
          currentImage = onboardingTwo;
          currentText = 'Grooming your horse';
          currenTextTwo =
              'You need to purchase grooming items to groom your horse. Grooming is an integral part of horse care.';

          update();
          break;
        case 2:
          currentImage = onboardingThree;
          currentText = 'PLANNING & REMINDERS';
          currenTextTwo =
              'Visual alerts and reminders Track and prepare for your next foal';
          update();
          break;
        case 3:
          currentImage = onboardingFour;
          currentText = 'PLANNING & REMINDERS';
          currenTextTwo =
              'Track lifetime costs associated with your horse Customizable reports at the tip of your fingers';
          update();
          break;
        default:
          break;
      }
      update();
    } else {
      Get.offAll(() => SignInScreen());
    }
  }
}
