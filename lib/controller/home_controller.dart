import 'package:e_course/core/class/statusrequest.dart';
import 'package:e_course/core/constant/routes.dart';
import 'package:e_course/core/functions/handlingdatacontroller.dart';
import 'package:e_course/core/services/services.dart';
import 'package:e_course/linkapi.dart';
import 'package:get/get.dart';
import 'package:e_course/data/datasource/remote/home_data.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  String? id;
  String? username;
  //List data = [];
  List categories = [];
  List items = [];
  String? lang;

  late StatusRequest statusRequest;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    id = myServices.sharedPreferences.getString("id");
    username = myServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("========================================");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "categoryid": categoryid,
    });
  }
}
