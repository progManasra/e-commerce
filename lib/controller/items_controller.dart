import 'package:e_course/core/class/statusrequest.dart';
import 'package:e_course/core/functions/handlingdatacontroller.dart';
import 'package:e_course/core/services/services.dart';
import 'package:e_course/data/datasource/remote/items_data.dart';
import 'package:e_course/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  String? categoryid;
  ItemsData itemsData = ItemsData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    categoryid = Get.arguments['categoryid'];
    getItems(categoryid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    categoryid = catval;
    getItems(catval);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
    print("========================================");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {'itemsModel': itemsModel});
  }
}
