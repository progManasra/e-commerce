import 'package:e_course/core/class/statusrequest.dart';
import 'package:e_course/core/constant/routes.dart';
import 'package:e_course/core/functions/handlingdatacontroller.dart';
import 'package:e_course/core/services/services.dart';
import 'package:e_course/data/datasource/remote/auth/login.dart';
import 'package:e_course/view/screen/home.dart';
import 'package:e_course/view/screen/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  bool issowpassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  LoginData loginData = LoginData(Get.find());

  List data = [];

  showPassword() {
    issowpassword = issowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString("id", response['data']['users_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['users_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences.setString("step", "2");

          Get.offNamed(AppRoute.homepage);
        } else {
          Get.defaultDialog(
              title: "Worning", middleText: "email or password is Wrong ...");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("=============Token=============");
      print(value);
      print("=============Token=============");

      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }
}
