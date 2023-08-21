import 'package:e_course/controller/favorite_controller.dart';
import 'package:e_course/controller/items_controller.dart';
import 'package:e_course/core/class/handlingdataview.dart';
import 'package:e_course/data/model/itemsmodel.dart';
import 'package:e_course/view/widget/customappbar.dart';
import 'package:e_course/view/widget/items/customlistitems.dart';
import 'package:e_course/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      child: ListView(children: [
        CustomAppBar(
          titleappbar: 'Find Product',
          onPressedIcon: () {},
          onPressedSearch: () {},
        ),
        SizedBox(
          height: 10,
        ),
        const ListCategoriesItems(),
        GetBuilder<ItemsControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                    itemCount: controller.data.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (BuildContext context, index) {
                      controllerFav
                              .isFavorite[controller.data[index]['items_id']] =
                          controller.data[index]['favorite'];
                      return CustomListItems(
                        itemsModel: ItemsModel.fromJson(controller.data[index]),
                      );
                    }))),
      ]),
    ));
  }
}
