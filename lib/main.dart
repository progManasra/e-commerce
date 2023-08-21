// ignore_for_file: deprecated_member_use

import 'package:e_course/bindings/intialbindings.dart';
import 'package:e_course/core/localization/changelocal.dart';
import 'package:e_course/core/localization/translation.dart';
import 'package:e_course/core/services/services.dart';
import 'package:e_course/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
