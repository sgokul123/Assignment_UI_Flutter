import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gin_finanse_registration/src/utils/utils.dart';

class DateTimeController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController animationController;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  final _selectedDate = DateTime.now().obs;
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  get selectedDate => this._selectedDate.value;

  set selectedDate(value) => this._selectedDate.value = value;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.onInit();
  }

  initData() {
    animationController
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    animationController.dispose();
    super.onClose();
  }

  void updateDateFunction(DateTime newDateTime) {
    selectedDate = newDateTime;
    dateController.text =
        "${selectedDate.timeZoneName}, ${selectedDate.day} ${Utils.getMonth(selectedDate.month)} ${selectedDate.year}";
  }

  void updateTimeFunction(TimeOfDay selectedTime) {
    String _hour, _minute, _time;
    _hour = selectedTime.hour.toString();
    _minute = selectedTime.minute.toString();
    _time = _hour + ' : ' + _minute;
    timeController.text = _time;
  }

  bool isValidInput() {
    if (timeController.text != null && dateController != null) {
      return timeController.text.isNotEmpty && dateController.text.isNotEmpty;
    } else
      return false;
  }
}
