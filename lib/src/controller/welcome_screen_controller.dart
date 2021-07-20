import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gin_finanse_registration/src/controller/date_time_controller.dart';
import 'package:gin_finanse_registration/src/controller/email_screen_controller.dart';
import 'package:gin_finanse_registration/src/controller/password_screen_controller.dart';
import 'package:gin_finanse_registration/src/controller/personal_info_controller.dart';
import 'package:gin_finanse_registration/src/utils/custom_logger.dart';
import 'package:gin_finanse_registration/src/utils/dialog_util.dart';
import 'package:gin_finanse_registration/src/widgets/stepper_view_widget.dart';

class WelcomeScreenController extends GetxController {
  BuildContext context;

  WelcomeScreenController({this.context});

  final _selectedIndex = 0.obs;

  get selectedIndex => this._selectedIndex.value;

  set selectedIndex(value) => this._selectedIndex.value = value;

  GlobalKey<State> keyChild1 = GlobalKey();
  GlobalKey<State> keyChild2 = GlobalKey();
  GlobalKey<State> keyChild3 = GlobalKey();
  GlobalKey<State> keyChild4 = GlobalKey();
  final _stepInfoList = List<StepperViewStep>.empty(growable: true).obs;

  get stepInfoList => this._stepInfoList.value;

  set stepInfoList(value) => this._stepInfoList.assignAll(value);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    List<StepperViewStep> stepInfoList = [
      StepperViewStep(isActive: false, state: StepperViewStepState.indexed),
      StepperViewStep(isActive: false, state: StepperViewStepState.indexed),
      StepperViewStep(isActive: false, state: StepperViewStepState.indexed),
      StepperViewStep(isActive: false, state: StepperViewStepState.indexed),
    ];
    this.stepInfoList = stepInfoList;
  }

  @override
  void onClose() {
    print("onClose onClose");
    super.onClose();
  }

  @override
  void dispose() {
    print("onClose onClose");
    super.dispose();
  }

  ///Call validation from welcome screen and proceed to next screen if validation successful
  void validateInput() {
    CustomLogger.log(selectedIndex);
    if (selectedIndex == 0) {
      CustomLogger.log(selectedIndex);
      if (Get.find<EmailScreenController>().validateEmail()) {
        goToNextStep();
      }
    } else if (selectedIndex == 1) {
      if (Get.find<PasswordScreenController>().isValidPassword()) {
        goToNextStep();
      }
    } else if (selectedIndex == 2) {
      if (Get.find<PersonalInfoController>().isValidFields()) {
        goToNextStep();
      }
    } else if (selectedIndex == 3) {
      if (Get.find<DateTimeController>().isValidInput()) {
        stepInfoList[selectedIndex].state = StepperViewStepState.complete;
        showAccountCreatedMessage();
      }
    }
  }

  ///On back press user should redirect to previous screen.
  void goToPreviousStep() {
    if (selectedIndex > 0) {
      selectedIndex--;
      stepInfoList[selectedIndex].state = StepperViewStepState.indexed;
    }
  }

  ///Proceed to next screen and update stepper index
  void goToNextStep() {
    stepInfoList[selectedIndex].state = StepperViewStepState.complete;
    selectedIndex++;
  }

  ///On registration successful show dialog and exit from app
  void showAccountCreatedMessage() {
    DialogUtil.showCustomDialog(
        context: context,
        onAlertDialogOptionSelected: () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        });
  }
}
