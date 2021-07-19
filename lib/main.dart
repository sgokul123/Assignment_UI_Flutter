import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gin_finanse_registration/src/controller/date_time_controller.dart';
import 'package:gin_finanse_registration/src/controller/email_screen_controller.dart';
import 'package:gin_finanse_registration/src/controller/password_screen_controller.dart';
import 'package:gin_finanse_registration/src/controller/personal_info_controller.dart';
import 'src/app.dart';

void main() {
  Get.put(DateTimeController());
  Get.put(PasswordScreenController());
  Get.put(PersonalInfoController());
  Get.put(EmailScreenController());
  runApp(App());
}
