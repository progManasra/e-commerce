import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_course/controller/productdetails_controller.dart';
import 'package:e_course/core/constant/color.dart';
import 'package:e_course/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        ),
        Positioned(
          top: 50,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageitems}/${controller.itemsModel.itemsImage!}",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
