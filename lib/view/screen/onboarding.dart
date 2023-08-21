import 'package:e_course/controller/onboarding_controller.dart';
import 'package:e_course/view/widget/onboarding/costomslider.dart';
import 'package:e_course/view/widget/onboarding/custombutton.dart';
import 'package:e_course/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: CustomSliderOnBoarding(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: const [
                  CustomDotControllerOnBoarding(),
                  Spacer(flex: 2),
                  CustomButtonOnBoarding(),
                ],
              ))
        ],
      ),
    ));
  }
}
