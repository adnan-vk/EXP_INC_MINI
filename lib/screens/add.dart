import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}
TextEditingController _date = TextEditingController();
String dropdownvalue = "INCOME";

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("ADD TRANSACTION"),
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
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          labelText: "DISCRIPTION"
                        ),
                      ),
                      SizedBox(height: 10,),
                      DropdownButton <String>(
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        value: dropdownvalue,
                        onChanged: (String? newvalue) {
                          setState(() {
                            dropdownvalue = newvalue!;
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
                      SizedBox(height: 10,),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          labelText: "ENTER THE AMOUNT",
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _date,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          labelText: "DATE",
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        onTap: () async{
                          DateTime? pickdate =await showDatePicker(
                            context: context, 
                            initialDate: DateTime.now(), 
                                             firstDate: DateTime(2000), lastDate: DateTime(2100));
                            if(pickdate != null){
                              setState(() {
                                _date.text = DateFormat('dd-MM-yyyy').format(pickdate);
                              });
                            }
                        },
                      ),
                       SizedBox(height: 10,),
                      ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 1, 66, 120))),
                        onPressed: (){}, 
                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                          vertical: width*0.03,
                            horizontal: height*0.03
                        ),
                        child: Text("SAVE"),
                      ))
                    ],
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