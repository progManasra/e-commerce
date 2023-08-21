import 'package:e_course/controller/onboarding_controller.dart';
import 'package:e_course/core/constant/color.dart';
import 'package:e_course/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    OnBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: EdgeInsets.all(3),
                          duration: const Duration(milliseconds: 100),
                          width: controller.currentPage == index ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        )),
              ],
            ));
  }
}
