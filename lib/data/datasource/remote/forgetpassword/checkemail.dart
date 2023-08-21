import 'package:e_course/core/class/crud.dart';
import 'package:e_course/linkapi.dart';

class CheckEmailData {
  Curd curd;
  CheckEmailData(this.curd);

  postData(
    String email,
  ) async {
    var response = await curd.postData(AppLink.checkEmail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
