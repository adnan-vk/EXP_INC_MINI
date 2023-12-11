import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mini/db/function/function.dart';
import 'package:mini/db/model/model.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}
final _date = TextEditingController();
final _decr = TextEditingController();
final _type = TextEditingController();
final _amt = TextEditingController();

String dropdownvalue = "Select type";

final _formKey = GlobalKey<FormState>();

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 45, 79),
        centerTitle: true,
        title: const Text("ADD TRANSACTION"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: height * 1.1,
          color: Colors.grey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: 
                Image.asset('assets/logo 2.png',width: width*0.5,height: height*0.11,),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,right: 15,
                  bottom: 150
                ),
                child: Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "the value is empty";
                            }else{
                              return null;
                            }
                          },
                          controller: _decr,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            labelText: "DISCRIPTION"
                          ),
                        ),
                        const SizedBox(height: 10,),
                        DropdownButtonFormField <String>(
                          decoration: InputDecoration(
                            hintText: "Select Item",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                          ),
                          dropdownColor: const Color.fromARGB(255, 208, 203, 203),
                          borderRadius: BorderRadius.circular(30),
                          isExpanded: true,
                          onChanged: (String? newvalue) {
                            setState(() {
                              dropdownvalue = newvalue.toString();
                              _type.text = dropdownvalue;
                            });
                          },
                          items: const [
                            DropdownMenuItem(
                              value: "INCOME",
                              child:Text("INCOME",style: TextStyle(
                                color: Colors.green
                              ),)),
                            DropdownMenuItem(
                              value: "EXPENCE",
                              child:Text("EXPENCE",style: TextStyle(color: Colors.red),)),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "the value is empty";
                            }else{
                              return null;
                            }
                          },
                          controller: _amt,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            labelText: "ENTER THE AMOUNT",
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "the value is empty";
                            }else{
                              return null;
                            }
                          },
                          readOnly: true,
                          controller: _date,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            labelText: "DATE",
                            suffixIcon: const Icon(Icons.calendar_today),
                          ),
                          onTap: () async{ 
                            DateTime? pickdate =await showDatePicker(
                              context: context, 
                              initialDate: DateTime.now(), 
                              firstDate: DateTime(2000), lastDate: DateTime(2100));
                              if(pickdate != null){
                                setState(() {
                                  _date.text = DateFormat.yMd().format(pickdate);
                                });
                              }
                          },
                        ),
                         const SizedBox(height: 10,),
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                            side: MaterialStatePropertyAll(BorderSide(width: 2,color: Color.fromARGB(255, 3, 45, 79)))
                            ),
                          onPressed: (){
                          if(_formKey.currentState!.validate()){
                            onSaveButtonClicked();
                           }
                          },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                            horizontal: height*0.03,
                            vertical: width*0.03,
                          ),
                          child: const Text("SAVE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                        ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSaveButtonClicked()async {
    final _descr = _decr.text.trim();
    final _amout = _amt.text.trim();
    final _typ = _type.text.trim();
    final _dte = _date.text.trim();
    if(_descr.isEmpty || _amout.isEmpty || _typ.isEmpty || _dte.isEmpty){
      return;
    }
    final transa = transactionmodel(discription: _descr, type: _typ, amount: _amout, date: _dte);
    addTransaction(transa);
    _decr.clear();
    _amt.clear();
    _type.clear();
    _date.clear();
    Navigator.pop(context);
  }
}