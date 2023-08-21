import 'package:e_course/core/class/crud.dart';
import 'package:e_course/linkapi.dart';

class TestData {
  Curd curd;
  TestData(this.curd);

  getData() async {
    var response = await curd.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
