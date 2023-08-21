import 'package:e_course/core/class/crud.dart';
import 'package:e_course/linkapi.dart';

class SignupData {
  Curd curd;
  SignupData(this.curd);

  postData(String username, String password, String email, String phone) async {
    var response = await curd.postData(AppLink.SignUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
