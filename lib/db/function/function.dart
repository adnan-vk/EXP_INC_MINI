import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mini/db/model/model.dart';

ValueNotifier<List <transactionmodel>> transactionListNotifier=ValueNotifier([]);

void addTransaction(transactionmodel value)async{
  final transactionDB= await Hive.openBox<transactionmodel>('transaction_db');
  await transactionDB.add(value);
  transactionListNotifier.value.add(value);
  transactionListNotifier.notifyListeners();
}
 
void getAllTransaction()async{
  final transactionDB= await Hive.openBox<transactionmodel>('transaction_db');
  transactionListNotifier.value.clear();
  transactionListNotifier.value.addAll(transactionDB.values);
  transactionListNotifier.notifyListeners();
}