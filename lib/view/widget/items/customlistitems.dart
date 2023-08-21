import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_course/controller/favorite_controller.dart';
import 'package:e_course/controller/items_controller.dart';
import 'package:e_course/core/constant/color.dart';
import 'package:e_course/core/functions/translatedatabase.dart';
import 'package:e_course/data/model/itemsmodel.dart';
import 'package:e_course/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  //final bool active;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "${itemsModel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.imageitems}/${itemsModel.itemsImage}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rating 3.5 ",
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 22,
                      child: Row(
                        children: [
                          ...List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    size: 15,
                                  ))
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemsModel.itemsPrice} \$",
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans"),
                    ),
                    GetBuilder<FavoriteControllerImp>(
                      builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemsModel.itemsId] ==
                                "1") {
                              controller.setFavorite(itemsModel.itemsId, "0");
                              controller.removeFavorite(itemsModel.itemsId!);
                            } else {
                              controller.setFavorite(itemsModel.itemsId, "1");
                              controller.addFavorite(itemsModel.itemsId!);
                            }
                          },
                          icon: Icon(
                            controller.isFavorite[itemsModel.itemsId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
