import 'package:e_course/controller/home_controller.dart';
import 'package:e_course/controller/items_controller.dart';
import 'package:e_course/core/constant/color.dart';
import 'package:e_course/core/functions/translatedatabase.dart';
import 'package:e_course/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

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

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.i, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToItems(controller.categories, i!);
        controller.changeCat(i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(builder: (controller) {
            return Container(
              padding: EdgeInsets.only(
                right: 10,
                left: 10,
                bottom: 2,
              ),
              decoration: controller.selectedCat == i
                  ? BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3, color: AppColor.primaryColor)))
                  : null,
              child: Text(
                "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                style: TextStyle(
                    fontSize: 20,
                    color: AppColor.greyBlack,
                    fontWeight: FontWeight.bold),
              ),
            );
          })
        ],
      ),
    );
  }
}
