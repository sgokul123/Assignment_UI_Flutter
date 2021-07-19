import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gin_finanse_registration/src/utils/constants.dart';
import 'package:gin_finanse_registration/src/utils/custom_color.dart';

class PasswordScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  TextEditingController pwdController = new TextEditingController();
  final _complexityColor = CustomColor.colorWhite.obs;
  final _showPassword = false.obs;
  final _containLowerCaseLetter = false.obs;
  final _containUpperCaseLetter = false.obs;
  final _containNumber = false.obs;
  final _pwdLength = false.obs;
  final _pwdComplexity = "".obs;

  get showPassword => this._showPassword.value;

  set showPassword(value) => this._showPassword.value = value;

  get complexityColor => this._complexityColor.value;

  set complexityColor(value) => this._complexityColor.value = value;

  get pwdComplexity => this._pwdComplexity.value;

  set pwdComplexity(value) => this._pwdComplexity.value = value;

  get pwdLength => this._pwdLength.value;

  set pwdLength(value) => this._pwdLength.value = value;

  get containNumber => this._containNumber.value;

  set containNumber(value) => this._containNumber.value = value;

  get containLowerCaseLetter => this._containLowerCaseLetter.value;

  set containLowerCaseLetter(value) =>
      this._containLowerCaseLetter.value = value;

  get containUpperCaseLetter => this._containUpperCaseLetter.value;

  set containUpperCaseLetter(value) =>
      this._containUpperCaseLetter.value = value;

  void checkPasswordValidation(String newValue) {
    if (newValue != null && newValue.isNotEmpty) {
      Pattern smallCasePattern = r'([a-z])';
      Pattern upperCasePattern = r'([A-Z])';
      Pattern numberPattern = r'([0-9])';
      containLowerCaseLetter = newValue.contains(RegExp(smallCasePattern));
      containUpperCaseLetter = newValue.contains(RegExp(upperCasePattern));
      containNumber = newValue.contains(RegExp(numberPattern));
      pwdLength = newValue.length > 9;

      String regex = '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[-+_!@#%^&*., ?])';
      if (containLowerCaseLetter &&
          containUpperCaseLetter &&
          containNumber &&
          pwdLength &&
          newValue.contains(RegExp(regex))) {
        pwdComplexity = STRONG;
        complexityColor = Colors.orange;
      } else if (containLowerCaseLetter &&
          containUpperCaseLetter &&
          containNumber &&
          pwdLength) {
        pwdComplexity = GOOD;
        complexityColor = Colors.tealAccent;
      } else if (containLowerCaseLetter &&
          containUpperCaseLetter &&
          containNumber) {
        pwdComplexity = WEAK;
        complexityColor = Colors.yellow;
      } else {
        pwdComplexity = VERY_WEAK;
        complexityColor = Colors.red;
      }
    } else {
      containLowerCaseLetter = false;
      containUpperCaseLetter = false;
      containNumber = false;
      pwdLength = false;
      pwdComplexity = "";
    }
  }

  bool isValidPassword() {
    return containLowerCaseLetter &&
        containUpperCaseLetter &&
        containNumber &&
        pwdLength;
  }
}
