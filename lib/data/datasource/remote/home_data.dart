import 'package:e_course/core/class/crud.dart';
import 'package:e_course/linkapi.dart';

class HomeData {
  Curd curd;
  HomeData(this.curd);

  getData() async {
    var response = await curd.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
