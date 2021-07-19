import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gin_finanse_registration/src/controller/personal_info_controller.dart';
import 'package:gin_finanse_registration/src/models/dataModel.dart';
import 'package:gin_finanse_registration/src/utils/constants.dart';
import 'package:gin_finanse_registration/src/widgets/custom_dropdown.dart';
import 'package:gin_finanse_registration/src/widgets/header_text_widget.dart';

class PersonalInformation extends StatelessWidget {
  final GlobalKey key;
  PersonalInfoController _controller;

  PersonalInformation(this.key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller = Get.find<PersonalInfoController>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder<DataModel>(
        future: _controller.getDropDownDataModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: HeaderText(
                      headerText: PERSONAL_INFO,
                      subHeaderText: FILL_INFO_AND_GOAL),
                ),
                Obx(
                  () => CustomDropDown(
                    hint: GOAL_FOR_ACTIVATION,
                    dropdownMenuItems: _controller
                        .buildDropDownMenuItems(snapshot.data.goalOfActivation),
                    selectedItem:
                        _controller.selectedGoalItem.toString().isEmpty
                            ? null
                            : _controller.selectedGoalItem,
                    callBack: (selectedValue) {
                      _controller.selectedGoalItem = selectedValue;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(
                  () => CustomDropDown(
                    hint: MONTHLY_INCOME,
                    dropdownMenuItems: _controller
                        .buildDropDownMenuItems(snapshot.data.monthlyIncome),
                    selectedItem:
                        _controller.selectedIncomeRange.toString().isEmpty
                            ? null
                            : _controller.selectedIncomeRange,
                    callBack: (selectedValue) {
                      _controller.selectedIncomeRange = selectedValue;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(
                  () => CustomDropDown(
                    hint: MONTHLY_EXPENSE,
                    dropdownMenuItems: _controller
                        .buildDropDownMenuItems(snapshot.data.monthlyExpense),
                    selectedItem:
                        _controller.selectedMonthlyExpense.toString().isEmpty
                            ? null
                            : _controller.selectedMonthlyExpense,
                    callBack: (selectedValue) {
                      _controller.selectedMonthlyExpense = selectedValue;
                    },
                  ),
                ),
              ],
            );
          } else {
            return Align(
              alignment: Alignment.center,
              child: Text(ERROR_WHILE_LOADING),
            );
          }
        },
      ),
    );
  }
}
