import 'package:flutter/material.dart';
import '../utils/custom_color.dart';

class HeaderText extends StatelessWidget {

  final String headerText;
  final String subHeaderText;

  HeaderText(
      {@required this.headerText, @required this.subHeaderText});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        headerText,
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: CustomColor.colorWhite),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        subHeaderText,
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: CustomColor.colorWhite, fontSize: 18),
      ),
      SizedBox(
        height: 20,
      ),
    ]);
  }
}
