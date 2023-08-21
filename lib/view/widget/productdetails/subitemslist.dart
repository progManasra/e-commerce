import 'package:e_course/controller/productdetails_controller.dart';
import 'package:e_course/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 5),
            height: 60,
            width: 100,
            decoration: BoxDecoration(
                color: controller.subitems[index]['active'] == 1
                    ? Colors.black
                    : AppColor.primaryColor,
                border: Border.all(color: AppColor.black),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              controller.subitems[index]['name'],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: controller.subitems[index]['active'] == 1
                      ? Colors.white
                      : AppColor.black),
            ),
          ),
        ),
      ],
    );
  }
}
