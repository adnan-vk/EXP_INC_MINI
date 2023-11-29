import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}
TextEditingController _date = TextEditingController();
String dropdownvalue = "INCOME";

class _EditState extends State<Edit> {
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
          padding: const EdgeInsets.only(top: 50),
          height: height * 1.1,
          color: Colors.grey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: 
                Image.asset('assets/logo 2.png',width: width*0.6,height: height*0.15,),
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
                      const SizedBox(height: 10,),
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
                      const SizedBox(height: 10,),
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
                      const SizedBox(height: 10,),
                      TextFormField(
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
                                _date.text = DateFormat('dd-MM-yyyy').format(pickdate);
                              });
                            }
                        },
                      ),
                       const SizedBox(height: 10,),
                      ElevatedButton(
                        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                        side: MaterialStatePropertyAll(BorderSide(width: 2,color: Color.fromARGB(255, 3, 45, 79)))
                        
                        ),
                        onPressed: (){}, 
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
              )
            ],
          ),
        ),
      ),
    );
  }
}