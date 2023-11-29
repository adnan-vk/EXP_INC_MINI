import 'package:flutter/material.dart';
import 'package:mini/screens/details.dart';
import 'package:mini/screens/edit.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

bool? ischecked = false;
class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 56, 86),
        centerTitle: true,
        title: const Text("TRANSACTIONS"),
        actions: [
          IconButton(onPressed: (){
          }, icon: const Icon(Icons.delete_outlined,color: Colors.red,)),
        ],
      ),
      body: Stack(
        children: [
          Container(
        color: Colors.grey,
        padding: const EdgeInsets.only(
          left: 10,right: 10,
        ),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 123, 117, 117),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                labelText: "Search Here....",labelStyle: const TextStyle(color: Colors.white)
              ),
            ),
            const SizedBox(height: 10,),
            const Text("Your Current Balance:",style: TextStyle(fontWeight: FontWeight.w500),),
            const Text("49236",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 1, 66, 120)),),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index){
               return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Details()));
                },
                 child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                    child: 
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            children: [
                              Text("Salary",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                              SizedBox(height: 10,),
                              Text("01-05-2023",style: TextStyle(fontWeight: FontWeight.w500),),
                              Text("Get the salary",style: TextStyle(fontWeight: FontWeight.w100),),
                              
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("50000",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
                              Row(
                                children: [
                                   Checkbox(value: ischecked, 
                                  activeColor: Colors.red,
                              onChanged: (newbool){
                                setState(() {
                                  ischecked = newbool;
                                });
                              }),
                                  IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Edit()));
                              }, 
                              icon: const Icon(Icons.edit,size: 20,)),
                                ],
                              )
                                                          ],
                          )
                        ],
                      ),
                    ),
                  ),
               );
              },
              itemCount: 50,
              ),
            ),
          ],
        ),
      ),
            
    ],
  )
  );
  }
}