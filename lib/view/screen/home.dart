import 'package:e_course/controller/home_controller.dart';
import 'package:e_course/core/class/handlingdataview.dart';
import 'package:e_course/view/widget/customappbar.dart';
import 'package:e_course/view/widget/home/customcardhome.dart';
import 'package:e_course/view/widget/home/customtitlehome.dart';
import 'package:e_course/view/widget/home/listcategorieshome.dart';
import 'package:e_course/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                CustomAppBar(
                  titleappbar: 'Find Product',
                  onPressedIcon: () {},
                  onPressedSearch: () {},
                ),
                CustomCardHome(
                  title: ' A Summer Surprise',
                  body: 'Cash Back 20%',
                ),
                CustomTitleHome(
                  title: 'Categries',
                ),
                ListCategoriesHome(),
                CustomTitleHome(
                  title: 'Product for you',
                ),
                ListItemsHome(),
                CustomTitleHome(
                  title: 'Offers',
                ),
                ListItemsHome(),
              ],
            ),
          ));
    });
  }
}
