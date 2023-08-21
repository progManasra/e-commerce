import 'package:e_course/controller/home_controller.dart';
import 'package:e_course/core/constant/color.dart';
import 'package:e_course/data/model/itemsmodel.dart';
import 'package:e_course/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ItemsHome(
              itemsModel: ItemsModel.fromJson(controller.items[index]),
            );
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 100,
          width: 180,
          child: Image.network(
            "${AppLink.imageitems}/${itemsModel.itemsImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.black.withOpacity(0.3),
          ),
          height: 100,
          width: 190,
        ),
        Positioned(
            left: 10,
            child: Text(
              "${itemsModel.itemsName}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ))
      ],
    );
  }
}
