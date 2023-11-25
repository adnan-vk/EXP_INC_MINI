import 'package:flutter/material.dart';

class hometab extends StatefulWidget {
  const hometab({super.key});

  @override
  State<hometab> createState() => _hometabState();
}

class _hometabState extends State<hometab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TRANSACTIONS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  labelText: "Search Here....",
                ),
              ),
              SizedBox(height: 10,),
              Text("Your Current Balance"),
              Text("49236",style: TextStyle(fontSize: 25),),

              ListView.builder(itemBuilder: (context, index){
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Salary"),
                          Text("50000")
                        ],
                      ),
                      Row(
                        children: [
                          Text("Get the salary"),
                          Text("01-05-2023"),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: 50,
              )
            ],
          ),
        ),
      ),
      );
  }
}