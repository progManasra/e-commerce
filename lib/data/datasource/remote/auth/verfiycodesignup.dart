import 'package:e_course/core/class/crud.dart';
import 'package:e_course/linkapi.dart';

class VerfiyCodeSignUpData {
  Curd curd;
  VerfiyCodeSignUpData(this.curd);

  postData(String email, String verifycode) async {
    var response = await curd.postData(AppLink.verfiycodesignUp, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
