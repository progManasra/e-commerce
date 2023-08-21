import 'package:e_course/core/constant/routes.dart';
import 'package:e_course/core/middelware/mymiddleware.dart';
import 'package:e_course/view/screen/auth/Forgetpassword/forgetpassword.dart';
import 'package:e_course/view/screen/auth/Forgetpassword/resetpassword.dart';
import 'package:e_course/view/screen/auth/Forgetpassword/success_resetpassword.dart';
import 'package:e_course/view/screen/auth/Forgetpassword/verfiycode.dart';
import 'package:e_course/view/screen/auth/Forgetpassword/verfiycodesignup.dart';
import 'package:e_course/view/screen/auth/login.dart';
import 'package:e_course/view/screen/auth/signup.dart';
import 'package:e_course/view/screen/auth/success_signup.dart';
import 'package:e_course/view/screen/homescreen.dart';
import 'package:e_course/view/screen/items.dart';
import 'package:e_course/view/screen/language.dart';
import 'package:e_course/view/screen/onboarding.dart';
import 'package:e_course/view/screen/productdetails.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  //Auth
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  GetPage(
    name: AppRoute.login,
    page: () => const Login(),
  ),
  GetPage(
    name: AppRoute.signUp,
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRoute.forgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoute.verfiyCode,
    page: () => VerfiyCode(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoute.successResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(
    name: AppRoute.successSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(
    name: AppRoute.verfiyCodeSignUp,
    page: () => const VerfiyCodeSignUp(),
  ),
  //OnBoarding

  GetPage(
    name: AppRoute.OnBoarding,
    page: () => const OnBoarding(),
  ),
  GetPage(
    name: AppRoute.items,
    page: () => const Items(),
  ),
  GetPage(
    name: AppRoute.homepage,
    page: () => const HomeScreen(),
  ),

  //ProductDetails
  GetPage(
    name: AppRoute.productdetails,
    page: () => const ProductDetails(),
  ),
];
