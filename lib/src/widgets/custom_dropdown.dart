import 'package:flutter/material.dart';
import 'package:gin_finanse_registration/src/utils/custom_color.dart';

import 'input_decoration.dart';

class CustomDropDown extends StatelessWidget {

  final  String hint;
  final String dropdownHint;
  final String selectedItem;
  final List<DropdownMenuItem<String>> dropdownMenuItems;
  final DropDownCallBack callBack;

  CustomDropDown({@required this.hint, this.dropdownHint  , this.selectedItem ,this.dropdownMenuItems , this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 10.0),
        borderRadius: BorderRadius.circular(14),
      ),
      child: InputDecorator(
        decoration: AppInputDecoration().getDecoration(
          hint: hint,
          contentPadding: EdgeInsets.all(0.0),
          borderRadius: 2,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            iconEnabledColor: Colors.grey,
            iconDisabledColor: Colors.grey,
            icon: Icon(Icons.keyboard_arrow_down, size: 24),
            hint: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                dropdownHint ?? "- Choose Option -",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 16, color: CustomColor.labelBlack),
                textAlign: TextAlign.start,
              ),
            ),
            value: selectedItem,
            items: dropdownMenuItems,
            onChanged: (value) {
              callBack(value);
            },
          ),
        ),
      ),
    );
  }
}

typedef DropDownCallBack = void Function(dynamic selectedValue);

