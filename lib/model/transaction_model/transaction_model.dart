import 'package:hive_flutter/hive_flutter.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class TransactionModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  double amount;
  @HiveField(2)
  String category;
  @HiveField(3)
  String type;
  @HiveField(4)
  DateTime date;
  @HiveField(5)
  String description;

  TransactionModel({
    this.id,
    required this.amount,
    required this.category,
    required this.type,
    required this.date,
    required this.description,
  });
}
