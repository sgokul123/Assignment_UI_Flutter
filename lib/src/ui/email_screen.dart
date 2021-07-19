import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gin_finanse_registration/src/controller/email_screen_controller.dart';
import 'package:gin_finanse_registration/src/utils/constants.dart';
import '../widgets/rectangle_half_circle_painter.dart';
import '../utils/custom_color.dart';
import '../widgets/input_fields.dart';

class EmailScreen extends StatelessWidget {
  final GlobalKey key;
  EmailScreenController _controller;

  EmailScreen(this.key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller = Get.find<EmailScreenController>();

    return Container(
      color: Colors.blue[50],
      child: Column(
        children: [
          Column(
            children: [
              CustomPaint(
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                ),
                painter:
                    CustomPath(color: CustomColor.appPrimaryColor, radius: 50),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RichText(
                  text: TextSpan(
                      text: WELCOME_GIN,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          color: CustomColor.labelBlack,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Finans',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                child: Text(
                  WELCOME_BANK_MESSAGE,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InputFieldArea(
                    hint: EMAIL,
                    obscure: false,
                    textEditingController: _controller.emailController,
                    maxLength: 64,
                    isEmpty: true,
                    textAction: TextInputAction.go,
                    onValueChanged: (newValue) {},
                    onFieldError: (newFocus) {},
                    inputType: TextInputType.emailAddress,
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.email_outlined,
                        color: CustomColor.darkGrey,
                      ),
                      onPressed: () {},
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
