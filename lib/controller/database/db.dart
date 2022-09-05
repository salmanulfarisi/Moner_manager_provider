import 'package:money_manager/model/transaction_model/transaction_model.dart';

abstract class Transaction {
  Future<void> addTransaction(TransactionModel value, context);
  Future<List<TransactionModel>> getAllTransactions();
  Future<void> deleteTransaction(String id, context);
  Future<void> updateTransaction({required data, required id});
  Future<void> resetApp();
}
