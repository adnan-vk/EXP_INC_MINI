import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mini/db/model/model.dart';
import 'package:mini/screens/edit.dart';

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
        date: date.text        
        );
        await transactiondb.putAt(index, traupdate);
        getAllTransaction();
  }