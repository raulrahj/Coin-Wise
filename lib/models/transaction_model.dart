import 'package:coin_wise/models/category_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 3)
class TransactionModel {
  @HiveField(0)
  final double amount;

  @HiveField(1)
  final String note;

  @HiveField(2)
  final CategoryField field;

  @HiveField(3)
  final CategoryModel category;

  @HiveField(4)
  final DateTime date;

  @HiveField(5)
  String? id;

  TransactionModel(
      {required this.date,
      required this.amount,
      required this.note,
      required this.field,
      required this.category}) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
