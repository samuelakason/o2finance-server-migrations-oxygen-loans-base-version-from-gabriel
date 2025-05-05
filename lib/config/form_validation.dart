import 'package:get/get_utils/src/get_utils/get_utils.dart';

class AppFormValidation {
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be atleast 6 characters";
    }
    return null;
  }

  String? validateText(String value) {
    if (value.length < 2) {
      return "Please fill this field appropriately";
    }
    return null;
  }
}
