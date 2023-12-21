import 'package:flutter/material.dart';
import 'package:mini/function/function.dart';
import 'package:mini/model/model.dart';

class AddProvider extends ChangeNotifier{
final date = TextEditingController();
final decr = TextEditingController();
final type = TextEditingController();
final amt = TextEditingController();

String dropdownvalue = "Select type";

final formKey = GlobalKey<FormState>();

  void onSaveButtonClicked(BuildContext context)async {
    final descr = decr.text.trim();
    final amout = amt.text.trim();
    final typ = type.text.trim();
    final dte = date.text.trim();
    if(descr.isEmpty || amout.isEmpty || typ.isEmpty || dte.isEmpty){
      return;
    }
    final transa = transactionmodel(discription: descr, type: typ, amount: amout, date: dte);
    addTransaction(transa);
    decr.clear();
    amt.clear();
    type.clear();
    date.clear();
    Navigator.pop(context);
  }
}