import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/controller/database/db.dart';
import 'package:money_manager/controller/provider/database_provider.dart';
import 'package:money_manager/model/transaction_model/transaction_model.dart';
import 'package:money_manager/utilities/strings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionDB implements Transaction {
  TransactionDB._internal();
  static final TransactionDB instance = TransactionDB._internal();
  factory TransactionDB() => instance;
  @override
  Future<void> addTransaction(TransactionModel value, context) async {
    final transactionDB = await Hive.openBox<TransactionModel>(transactionDb);
    await transactionDB.put(value.id, value);
    refreshUi(context);
  }

  @override
  Future<void> deleteTransaction(String id, context) async {
    final transactionDB = await Hive.openBox<TransactionModel>(transactionDb);
    await transactionDB.delete(id);
    refreshUi(context);
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final transactionDB = await Hive.openBox<TransactionModel>(transactionDb);
    return transactionDB.values.toList();
  }

  @override
  Future<void> resetApp() async {
    final transactionDB = await Hive.openBox<TransactionModel>(transactionDb);
    await transactionDB.clear();
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.clear();
  }

  Future<void> refreshUi(ctx) async {
    final transactionList = await getAllTransactions();
    transactionList.sort((a, b) => b.date.compareTo(a.date));
    Provider.of<DataBaseProvider>(ctx, listen: false)
        .addTransactionProvider(value: transactionList);
  }

  @override
  Future<void> updateTransaction({required data, required id, context}) async {
    final transactionDB = await Hive.openBox<TransactionModel>(transactionDb);
    transactionDB.put(id, data);
    refreshUi(context);
  }

  // @override
  // Future<void> updateTransaction(data, int index, context) async {
  //   final transactionDB = await Hive.openBox<TransactionModel>(transactionDb);
  //   transactionDB.putAt(index, data);
  //   refreshUi(co)
  // }
}
