import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gin_finanse_registration/src/controller/date_time_controller.dart';
import 'package:gin_finanse_registration/src/utils/constants.dart';

import '../utils/custom_color.dart';
import '../widgets/header_text_widget.dart';
import '../widgets/input_decoration.dart';

class DateAndTimeWidget extends StatelessWidget {
  final GlobalKey key;
  BuildContext mContext;
  DateTimeController _controller;

  DateAndTimeWidget(this.key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.mContext = context;
    _controller = Get.find<DateTimeController>();
    _controller.initData();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        child: Stack(
          children: [
            showCalenderIcon(),
            Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                HeaderText(
                    headerText: SCHEDULE_CALL,
                    subHeaderText: CHOOSE_DATE_TIME_PREFERRED),
                getDateDropdownMenu(
                    hint: DATE,
                    dropdownHint: CHOOSE_DATE,
                    flagToShowTime: false,
                    textEditingController: _controller.dateController),
                SizedBox(
                  height: 30,
                ),
                getDateDropdownMenu(
                    hint: TIME,
                    dropdownHint: CHOOSE_TIME,
                    flagToShowTime: true,
                    textEditingController: _controller.timeController),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getDateDropdownMenu(
      {@required String hint,
      String dropdownHint,
      TextEditingController textEditingController,
      bool flagToShowTime}) {
    DateTimeController dateTimeController = Get.find<DateTimeController>();
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
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: null,
                hintText: dropdownHint,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: CustomColor.labelBlack,
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: null,
                )),
            readOnly: true,
            controller: textEditingController,
            onTap: () {
              if (flagToShowTime) {
                _selectTime(mContext, dateTimeController);
              } else {
                _selectDate(mContext, dateTimeController);
              }
            },
            onChanged: (value) {},
          )),
    );
  }

  Future<Null> _selectTime(
      BuildContext context, DateTimeController dateTimeController) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: dateTimeController.selectedTime,
    );
    if (picked != null) dateTimeController.updateTimeFunction(picked);
  }

  Future<Null> _selectDate(
      BuildContext context, DateTimeController dateTimeController) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dateTimeController.selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) dateTimeController.updateDateFunction(picked);
  }

  showCalenderIcon() {
    DateTimeController controller = Get.find<DateTimeController>();
    return AnimatedBuilder(
      animation: controller.animationController,
      builder: (context, child) {
        return Container(
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: CircleBorder(),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0 * controller.animationController.value),
            child: child,
          ),
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder(),
        ),
        child: IconButton(
          onPressed: () {},
          color: Colors.blue,
          icon: Icon(Icons.date_range_sharp, size: 24),
        ),
      ),
    );
  }
}
