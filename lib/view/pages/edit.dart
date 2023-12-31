import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mini/controller/editprovider.dart';
import 'package:mini/function/function.dart';
import 'package:provider/provider.dart';


final decr = TextEditingController();
final type = TextEditingController();
final amt = TextEditingController();
TextEditingController date = TextEditingController();

class Edit extends StatefulWidget {
  final String decr;
  final String type;
  final String amount;
  final String date;
  final int index;

  const Edit({super.key,  
  required this.decr, 
  required this.type, 
  required this.amount, 
  required this.date, 
  required this.index});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {

  @override
  void initState(){
    super.initState();

    decr.text = widget.decr;
    type.text = widget.type;
    amt.text = widget.amount;
    date.text = widget.date;
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 45, 79),
        centerTitle: true,
        title: const Text("EDIT SCREEN"),
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Consumer<EditProvider>(
                    builder: (context, Provider, child) => 
                     Column(
                      children: [
                        TextFormField(
                          controller: decr,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            labelText: "DISCRIPTION"
                          ),
                        ),
                        const SizedBox(height: 10,),
                        DropdownButton <String>(
                          dropdownColor: const Color.fromARGB(255, 208, 203, 203),
                          borderRadius: BorderRadius.circular(20),
                          isExpanded: true,
                          underline: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                          value: Provider.dropdownvalue,
                          onChanged: (String? newvalue) {
                            Provider.editprvd(newvalue);
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
                          controller: amt,
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
                          readOnly: true,
                          controller: date,
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
                                  date.text = DateFormat.yMd().format(pickdate);
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
                            Navigator.pop(context);
                            updatetransaction(widget.index);
                          },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                            vertical: width*0.03,
                              horizontal: height*0.03
                          ),
                          child: const Text("UPDATE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
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
}