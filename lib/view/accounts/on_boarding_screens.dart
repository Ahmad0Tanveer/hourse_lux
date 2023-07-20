import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hourse_lux/core/constant/colors.dart';
import 'package:hourse_lux/core/helpers/on_boarding_provider.dart';
import 'package:hourse_lux/view/accounts/login_screen.dart';

import '../customs/custom_button.dart';
import '../customs/custom_text.dart';

class OnboardingScreens extends StatelessWidget {
  final boarding = Get.put(OnBoardingProvider());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: boarding,
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Image.asset(
              boarding.currentImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
              child: Container(
                height: 380.h,
                decoration: BoxDecoration(
                  color: whiteColor,
                ),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                  child: Column(
                    children: [
                      CustomText(
                        text: boarding.currentText,
                        color: blackColor,
                        fontSize: 23.sp,
                      ),
                      SizedBox(height: 20.h),
                      CustomText(
                        maxLines: 2,
                        text: boarding.currenTextTwo,
                        color: blackColor.withOpacity(0.5),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          4,
                              (index) => Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Container(
                              height: 7.h,
                              width: 7.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == boarding.currentIndex
                                    ? darkBlueColor
                                    : greyColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      GestureDetector(
                        onTap: () => Get.off(() => SignInScreen()),
                        child: CustomText(
                          text: 'Skip',
                          color: blackColor,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      RoundedButton(
                        text: 'Next',
                        press: () => boarding.changeIndex(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
