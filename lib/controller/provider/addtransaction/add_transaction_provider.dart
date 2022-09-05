import 'package:flutter/material.dart';
import 'package:money_manager/controller/database/db_functions.dart';
import 'package:money_manager/model/transaction_model/transaction_model.dart';
import 'package:money_manager/utilities/functions/navigator_functions.dart';
import 'package:money_manager/utilities/functions/showsnakbar.dart';
import 'package:money_manager/view/navigation/screen_navigation.dart';

class AddTransactionProvider extends ChangeNotifier {
  String _type = 'Income';
  double amount = 0;
  String category = '';
  String _description = '';
  DateTime selectedDate = DateTime.now();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  // final List<String> suggestionList = [];
  List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  get types => _type;
  set type(String types) {
    _type = types;
    notifyListeners();
  }

  get date => selectedDate;
  set dates(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  get amounts => amount;
  set amountTrans(double amount) {
    amount = amount;
    notifyListeners();
  }

  get description => _description;
  set descriptions(String description) {
    _description = description;
    notifyListeners();
  }

  get categorys => category;
  set categoryTrans(String category) {
    category = category;
    notifyListeners();
  }

  get monthName => month[selectedDate.month - 1];
  set monthNames(String monthName) {
    monthName = monthName;
    notifyListeners();
  }

  // get suggestionLists => suggestionList;
  // set suggestionList(List<String> suggestionList) {
  //   suggestionList = suggestionList;
  //   notifyListeners();
  // }

  // Future<void> selectdate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2021),
  //       lastDate: selectedDate);

  //   if (picked != null && picked != selectedDate) {
  //     dates = picked;
  //   }
  // }
  Future<void> selectDate(context) async {
    final selectedDateNow = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (selectedDateNow == null) {
      return;
    } else {
      dates = selectedDateNow;
    }
  }

  Future<void> addTransaction(BuildContext context) async {
    // await Future.delayed(const Duration(seconds: 1));
    final amount = amounts;
    final selectDate = selectedDate;
    final category = categoryController.text;
    final description = descriptionController.text;
    final type = _type;
    if (amount == 0 || category.isEmpty) {
      ShowSnackBar.showSnackBarFail(context, 'Please fill all the fields');
      return;
    } else {
      final transaction = TransactionModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        amount: amount,
        category: category,
        type: type,
        date: selectDate,
        description: description,
      );
      ShowSnackBar.showSnackBarSuccess(context, 'Successfully added');
      TransactionDB.instance.addTransaction(transaction, context);
      NavigationFunctions.navigatePushReplacement(
          context, const ScreenNavigation());
    }
  }
}
