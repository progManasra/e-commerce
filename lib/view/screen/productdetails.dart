// ignore_for_file: deprecated_member_use, prefer_const_constructors
import 'package:e_course/controller/productdetails_controller.dart';
import 'package:e_course/core/constant/color.dart';
import 'package:e_course/view/widget/productdetails/priceandcount.dart';
import 'package:e_course/view/widget/productdetails/subitemslist.dart';
import 'package:e_course/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 60,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.primaryColor,
          onPressed: () {},
          child: Text(
            "Add To Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            TopProductPageDetails(),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${controller.itemsModel.itemsName}",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: AppColor.primaryColor),
                  ),
                  PriceAndCountItems(
                    price: '200.0',
                    count: '2',
                    onAdd: () {},
                    onRemove: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${controller.itemsModel.itemsDesc}",
                    style: Theme.of(context).textTheme.bodyText1!,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Color",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: AppColor.primaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SubItemsList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
