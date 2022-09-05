import 'package:flutter/material.dart';
import 'package:money_manager/controller/database/db_functions.dart';
import 'package:money_manager/model/transaction_model/transaction_model.dart';

class UpdateTransactionProvider extends ChangeNotifier {
  final updatedAmount = TextEditingController();
  final updatedCategory = TextEditingController();
  final updatedDescription = TextEditingController();
  double updateAmount = 0;
  String category = '';
  String description = '';
  DateTime updateTime = DateTime.now();
  String? type;

  get showDate => updateTime;
  get showType => type;
  get showDescription => description;
  get amounts => updateAmount;

  set showDate(selectedDate) {
    updateTime = selectedDate;
    notifyListeners();
  }

  set showType(value) {
    type = value;
    notifyListeners();
  }

  set amountTrans(double amount) {
    amount = amount;
    notifyListeners();
  }

  set showDescr(String description) {
    description = description;
    notifyListeners();
  }

  updateSubmission(BuildContext context, String id, TransactionModel data) {
    final incomeOrExpenseValue = type.toString();
    final amount =
        updatedAmount.text.isEmpty ? 0.0 : double.parse(updatedAmount.text);
    final categoryTypeName = updatedCategory.toString();
    final selectedDateNew = showDate;
    final note = updatedDescription.text;

    if (amount == 0 || amount.isNegative) {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill all the fields',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      final transaction = TransactionModel(
        id: data.id, amount: amount, category: category,
        date: showDate, description: description,
        type: incomeOrExpenseValue,

        // incomeOrExpense: incomeOrExpenseValue,
        // amount: amount,
        // categoryTypeName: categoryTypeName,
        // selectedDate: selectedDateNew,
        // note: note,
      );
      TransactionDB.instance.updateTransaction(data: transaction, id: id);
      Navigator.of(context).pop();
      TransactionDB.instance.refreshUi(context);
      if (amount != data.amount ||
          categoryTypeName != data.category ||
          selectedDateNew != data.date ||
          note != data.description) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Successfully Updated',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

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
      showDate = selectedDateNow;
    }
  }
}
