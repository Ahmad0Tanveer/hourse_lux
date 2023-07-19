import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/assets.dart';
import '../sign_in_screen/sign_in_screen.dart';

class OnBoardingProvider extends ChangeNotifier {
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

          notifyListeners();
          break;
        case 2:
          currentImage = onboardingThree;
          currentText = 'PLANNING & REMINDERS';
          currenTextTwo =
              'Visual alerts and reminders Track and prepare for your next foal';
          notifyListeners();
          break;
        case 3:
          currentImage = onboardingFour;
          currentText = 'PLANNING & REMINDERS';
          currenTextTwo =
              'Track lifetime costs associated with your horse Customizable reports at the tip of your fingers';
          notifyListeners();
          break;
        default:
          break;
      }
      notifyListeners();
    } else {
      Get.offAll(() => SignInScreen());
    }
  }
}
