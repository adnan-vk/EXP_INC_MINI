import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class transactionmodel extends HiveObject{

  @HiveField(0)
  final String discription;

  @HiveField(1)
  final String type;

  @HiveField(2)
  final String amount;

  @HiveField(3)
  final String date;

  transactionmodel({required this.discription, required this.type, required this.amount, required this.date});
}