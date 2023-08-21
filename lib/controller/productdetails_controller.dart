import 'package:e_course/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;

  intialData() {
    itemsModel = Get.arguments['itemsModel'];
  }

  List subitems = [
    {
      "name": "Red",
      "id": 1,
      "active": "1",
    },
    {
      "name": "Yallow",
      "id": 2,
      "active": "0",
    },
    {
      "name": "Black",
      "id": 3,
      "active": "0",
    },
  ];

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
