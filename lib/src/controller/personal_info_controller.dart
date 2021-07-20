import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gin_finanse_registration/src/models/dataModel.dart';
import 'package:gin_finanse_registration/src/models/montly_expense_model.dart';
import 'package:gin_finanse_registration/src/utils/custom_logger.dart';

class PersonalInfoController extends GetxController
    with SingleGetTickerProviderMixin {
  final _selectedGoalItem = "".obs;
  final _selectedIncomeRange = "".obs;
  final _selectedMonthlyExpense = "".obs;
  final _model = null.obs;

  get selectedGoalItem => this._selectedGoalItem.value;

  set selectedGoalItem(value) => this._selectedGoalItem.value = value;

  get model => this._model.value;

  set model(value) => this._model.value = value;

  get selectedIncomeRange => this._selectedIncomeRange.value;

  set selectedIncomeRange(value) => this._selectedIncomeRange.value = value;

  get selectedMonthlyExpense => this._selectedMonthlyExpense.value;

  set selectedMonthlyExpense(value) =>
      this._selectedMonthlyExpense.value = value;

  ///Validate monthly expense, monthly income and goal setting
  bool isValidFields() {
    if (selectedMonthlyExpense != null &&
        selectedGoalItem != null &&
        selectedIncomeRange != null) {
      return selectedMonthlyExpense.isNotEmpty &&
          selectedGoalItem.isNotEmpty &&
          selectedIncomeRange.isNotEmpty;
    } else
      return false;
  }

  ///Read json and parse into model to display in dropdown
  Future<DataModel> getDropDownDataModel() async {
    try {
      CustomLogger.log("_model");
      String string = await rootBundle.loadString('assets/data.json');
      Map<String, dynamic> values = json.decode(string);
      DataModel tempModel = DataModel.fromJson(values);
      CustomLogger.log("_model ${tempModel.toJson()}");
      return tempModel;
    } on Exception catch (e) {
      CustomLogger.log("Exception $e");
      return null;
    }
  }

  ///Get Dropdown list item to display for selection
  List<DropdownMenuItem<String>> buildDropDownMenuItems(
      List<MonthlyExpenseModel> listItems) {
    List<DropdownMenuItem<String>> items = List.empty(growable: true);
    for (MonthlyExpenseModel listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem.name,
        ),
      );
    }
    return items;
  }
}
