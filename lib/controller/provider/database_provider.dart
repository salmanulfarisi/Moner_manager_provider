import 'package:flutter/material.dart';
import 'package:money_manager/model/transaction_model/transaction_model.dart';

class DataBaseProvider extends ChangeNotifier {
  List<TransactionModel> transactionProvider = [];

  addTransactionProvider({required value}) {
    transactionProvider.clear();
    transactionProvider.addAll(value);
    notifyListeners();
  }

  List<double> totalStatistics() {
    double incomeTotal = 0;
    double expenseTotal = 0;
    for (int i = 0; i < transactionProvider.length; i++) {
      transactionProvider[i].type == 'Income'
          ? incomeTotal += transactionProvider[i].amount
          : expenseTotal += transactionProvider[i].amount;
    }
    double totalBalance = incomeTotal - expenseTotal;
    totalBalance < 0 ? totalBalance = 0 : totalBalance;
    return [totalBalance, incomeTotal, expenseTotal];
  }
}
