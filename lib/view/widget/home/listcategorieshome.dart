import 'package:e_course/controller/home_controller.dart';
import 'package:e_course/core/constant/color.dart';
import 'package:e_course/core/functions/translatedatabase.dart';
import 'package:e_course/data/model/categoriesmodel.dart';
import 'package:e_course/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: ((context, index) => SizedBox(
              width: 10,
            )),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.i, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: AppColor.therdColor,
                borderRadius: BorderRadius.circular(10)),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.imagecategories}/${categoriesModel.categoriesImage}",
            ),
          ),
          Text(
            "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: TextStyle(fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}
