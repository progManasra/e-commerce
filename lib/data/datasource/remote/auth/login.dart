import 'package:e_course/core/class/crud.dart';
import 'package:e_course/linkapi.dart';

class LoginData {
  Curd curd;
  LoginData(this.curd);

  postData(
    String email,
    String password,
  ) async {
    var response = await curd.postData(AppLink.Login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
