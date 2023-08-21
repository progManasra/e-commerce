import 'package:e_course/core/class/crud.dart';
import 'package:e_course/linkapi.dart';

class ResetPasswordData {
  Curd curd;
  ResetPasswordData(this.curd);

  postData(
    String email,
    String password,
  ) async {
    var response = await curd.postData(AppLink.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
