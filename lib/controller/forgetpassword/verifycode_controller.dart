import 'package:e_course/core/class/statusrequest.dart';
import 'package:e_course/core/constant/routes.dart';
import 'package:e_course/core/functions/handlingdatacontroller.dart';
import 'package:e_course/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeFForgetPasswordData verifyCodeFForgetPasswordData =
      VerifyCodeFForgetPasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  checkCode() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeFForgetPasswordData.postData(email!, verifycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Worning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
