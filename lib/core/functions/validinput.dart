import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not Valid UserName";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not Valid Email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not Valid Phone Number";
    }
  }
  if (val.isEmpty) {
    return "value can't be empty";
  }
  if (val.length < min) {
    return "value can't be less than $min";
  }
  if (val.length > max) {
    return "value can't be more than $max";
  }
}
