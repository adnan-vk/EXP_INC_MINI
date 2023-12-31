import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mini/model/model.dart';
import 'package:mini/view/pages/edit.dart';



ValueNotifier<List <transactionmodel>> transactionListNotifier=ValueNotifier([]); 

void addTransaction(transactionmodel value)async{
  final transactionDB= await Hive.openBox<transactionmodel>('transaction_db');
  await transactionDB.add(value);
  transactionListNotifier.value.add(value);
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  transactionListNotifier.notifyListeners();
}

void getAllTransaction()async{
  final transactionDB= await Hive.openBox<transactionmodel>('transaction_db');
  transactionListNotifier.value.clear();
  transactionListNotifier.value.addAll(transactionDB.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  transactionListNotifier.notifyListeners();
}

Future<void> deleteTransaction(int index)async{
  final transactiondb=await Hive.openBox<transactionmodel>('transaction_db');
  await transactiondb.deleteAt(index);
  getAllTransaction();
}

Future<void> updatetransaction(int index)async{
    final transactiondb=await Hive.openBox<transactionmodel>('transaction_db');
      final traupdate = transactionmodel(
        discription: decr.text,
        type: type.text,
        amount: amt.text,
        date: date.text,
        );
        await transactiondb.putAt(index, traupdate);
        getAllTransaction();
  }


double calculateTotalCost(List<transactionmodel> Trans) {
  double totalCost = 0;
  for (var x in Trans) {
    totalCost += double.parse(x.amount);
  }
  return totalCost;
}