import 'montly_expense_model.dart';

class DataModel {
  List goalOfActivation = List<MonthlyExpenseModel>.empty(growable: true);
  List monthlyIncome = List<MonthlyExpenseModel>.empty(growable: true);
  List monthlyExpense = List<MonthlyExpenseModel>.empty(growable: true);

  DataModel({this.goalOfActivation, this.monthlyIncome, this.monthlyExpense});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      goalOfActivation: json['goalOfActivation'] != null
          ? List<MonthlyExpenseModel>.from(json['goalOfActivation']
              .map((i) => MonthlyExpenseModel.fromJson(i)))
          : null,
      monthlyExpense: json['monthlyExpense'] != null
          ? List<MonthlyExpenseModel>.from(json['monthlyExpense']
              .map((i) => MonthlyExpenseModel.fromJson(i)))
          : null,
      monthlyIncome: json['monthlyIncome'] != null
          ? List<MonthlyExpenseModel>.from(
              json['monthlyIncome'].map((i) => MonthlyExpenseModel.fromJson(i)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "goalOfActivation": this.goalOfActivation,
      "monthlyIncome": this.monthlyIncome,
      "monthlyExpense": this.monthlyExpense,
    };
  }
}
