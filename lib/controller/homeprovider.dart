import 'package:flutter/material.dart';
import 'package:mini/function/function.dart';
import 'package:mini/model/model.dart';

class HomeProvider extends ChangeNotifier{
  String search = "";
  List<transactionmodel> searchList = [];
  // List<transactionmodel> srlist = [];
  void searchResult(value){
    searchList = transactionListNotifier.value
          .where((transactionmodel) =>
              transactionmodel.discription.toLowerCase().contains(search.toLowerCase()))
          .toList();
          notifyListeners();
  }
  
double bal(){
  double currentbalance = 0.0;
  double income = 0.0;
  double expence = 0.0;

  for(var x in transactionListNotifier.value){
    if(x.type == "INCOME"){
      income += double.parse(x.amount);
    }else if(x.type == "EXPENCE"){
      expence += double.parse(x.amount);
    }
  }
  currentbalance = income - expence;
  return currentbalance;
  }

}