import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gin_finanse_registration/src/controller/welcome_screen_controller.dart';
import 'package:gin_finanse_registration/src/ui/date_time_screen.dart';
import 'package:gin_finanse_registration/src/ui/email_screen.dart';
import 'package:gin_finanse_registration/src/ui/personal_information.dart';
import 'package:gin_finanse_registration/src/utils/constants.dart';
import 'package:gin_finanse_registration/src/utils/custom_color.dart';
import 'package:gin_finanse_registration/src/widgets/stepper_view_widget.dart';

import 'password_screen.dart';

class WelcomeScreen extends StatelessWidget {
  BuildContext mContext;
  WelcomeScreenController _controller;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    Get.lazyPut<WelcomeScreenController>(
        () => WelcomeScreenController(context: context));
    _controller = Get.find<WelcomeScreenController>();
    return Obx(() => Scaffold(
          backgroundColor: _controller.selectedIndex == 0
              ? Colors.blue[50]
              : CustomColor.appPrimaryColor,
          appBar: _controller.selectedIndex > 0
              ? AppBar(
                  title: Text(CREATE_ACCOUNT),
                  backgroundColor: CustomColor.appPrimaryColor,
                  leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        _controller.goToPreviousStep();
                      }),
                )
              : null,
          body: buildPages(context),
        ));
  }

  Widget buildPages(BuildContext context) {
    return GetX<WelcomeScreenController>(
        initState: (state) => Get.find<WelcomeScreenController>(),
        builder: (_controller) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        StepperView(
                          currentStep: _controller.selectedIndex,
                          onStepTapped: (index) {
                            _controller.selectedIndex = index;
                          },
                          steps: _controller.stepInfoList,
                        ),
                        getPages(_controller.selectedIndex, _controller),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: _buildButton(_controller),
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget _buildButton(WelcomeScreenController controller) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(
      fontSize: 20,
    ));
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: _controller.selectedIndex == 0
              ? CustomColor.appPrimaryColor
              : Colors.blue[50],
          padding: EdgeInsets.symmetric(vertical: 5),
          textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      onPressed: () {
        controller.validateInput();
      },
      child: Text(
        NEXT,
        style: TextStyle(
            fontSize: 18,
            color: _controller.selectedIndex == 0
                ? Colors.blue[50]
                : CustomColor.appPrimaryColor),
      ),
    );
  }

  Widget getPages(int index, WelcomeScreenController controller) {
    switch (index) {
      case 0:
        return EmailScreen(controller.keyChild1);
        break;
      case 1:
        return CreatePassword(
          controller.keyChild2,
        );
        break;
      case 2:
        return PersonalInformation(controller.keyChild3);
        break;
      case 3:
        return DateAndTimeWidget(controller.keyChild4);
        break;
      default:
        return Container();
    }
  }
}
