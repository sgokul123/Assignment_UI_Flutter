import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gin_finanse_registration/src/controller/password_screen_controller.dart';
import 'package:gin_finanse_registration/src/utils/constants.dart';

import '../utils/custom_color.dart';
import '../widgets/header_text_widget.dart';
import '../widgets/input_fields.dart';

class CreatePassword extends StatelessWidget {
  final GlobalKey key;

  CreatePassword(this.key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<PasswordScreenController>(
        initState: (state) => Get.find<PasswordScreenController>(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(
                    headerText: CREATE_PASSWORD,
                    subHeaderText: PASSWORD_TO_LOGIN),
                InputFieldArea(
                    hint: CREATE_PASSWORD,
                    obscure: controller.showPassword,
                    textEditingController: controller.pwdController,
                    maxLength: 20,
                    isEmpty: true,
                    textAction: TextInputAction.go,
                    onValueChanged: (newValue) {
                      controller.checkPasswordValidation(newValue);
                    },
                    onFieldError: (newFocus) {},
                    inputType: TextInputType.text,
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color:
                            controller.showPassword ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        controller.showPassword = !controller.showPassword;
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      COMPLEXITY,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: CustomColor.colorWhite, fontSize: 16),
                    ),
                    Text(controller.pwdComplexity ?? "",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: controller.complexityColor ??
                                CustomColor.colorWhite,
                            fontSize: 14)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PasswordComplexityCheckWidget(
                        isContained: controller.containLowerCaseLetter,
                        title: 'a',
                        subTitle: LOWERCASE),
                    PasswordComplexityCheckWidget(
                        isContained: controller.containUpperCaseLetter,
                        title: 'A',
                        subTitle: UPPERCASE),
                    PasswordComplexityCheckWidget(
                        isContained: controller.containNumber,
                        title: '123',
                        subTitle: NUMBER),
                    PasswordComplexityCheckWidget(
                        isContained: controller.pwdLength,
                        title: '9+',
                        subTitle: CHARACTERS),
                  ],
                )
              ],
            ),
          );
        });
  }
}

class PasswordComplexityCheckWidget extends StatelessWidget {
  final bool isContained;
  final String title;
  final String subTitle;

  PasswordComplexityCheckWidget({
    @required this.isContained,
    @required this.title,
    @required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isContained
            ? _buildCircle()
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: CustomColor.colorWhite),
                )),
        Text(
          subTitle,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: CustomColor.colorWhite, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildCircle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      width: 24,
      height: 24,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.check,
            color: CustomColor.colorWhite,
            size: 16.0,
          ),
        ),
      ),
    );
  }
}
