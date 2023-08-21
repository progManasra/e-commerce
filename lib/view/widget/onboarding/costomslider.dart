// ignore_for_file: deprecated_member_use

import 'package:e_course/controller/onboarding_controller.dart';
import 'package:e_course/core/constant/color.dart';
import 'package:e_course/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: OnBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(
            OnBoardingList[i].title!,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.black),
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset(
            OnBoardingList[i].image!,
            height: Get.width / 1.3,
            width: Get.height / 1.6,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                OnBoardingList[i].body!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              )),
        ],
      ),
    );
  }
}
