import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();

  bool validateEmail() {
    if (emailController.text != null) {
      String regex =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(regex);
      return emailController.text.isNotEmpty &&
          regExp.hasMatch(emailController.text);
    } else {
      return false;
    }
  }
}
