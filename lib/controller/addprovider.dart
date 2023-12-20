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
    final _descr = decr.text.trim();
    final _amout = amt.text.trim();
    final _typ = type.text.trim();
    final _dte = date.text.trim();
    if(_descr.isEmpty || _amout.isEmpty || _typ.isEmpty || _dte.isEmpty){
      return;
    }
    final transa = transactionmodel(discription: _descr, type: _typ, amount: _amout, date: _dte);
    addTransaction(transa);
    decr.clear();
    amt.clear();
    type.clear();
    date.clear();
    Navigator.pop(context);
  }
}