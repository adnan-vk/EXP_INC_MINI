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
      body: Stack(
        children: [
          Container(
        color: Colors.grey,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 123, 117, 117),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                labelText: "Search Here....",labelStyle: TextStyle(color: Colors.white)
              ),
            ),
            SizedBox(height: 10,),
            Text("Your Current Balance"),
            Text("49236",style: TextStyle(fontSize: 25),),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index){
               return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Salary"),
                            Text("50000")
                          ],
                        ),
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Get the salary"),
                            Text("01-05-2023"),
                          ],
                        )
                      ],
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
              Positioned(
                bottom: 15,
                right: 15,
                child: FloatingActionButton.extended(
                  icon: Icon(Icons.add),
                  onPressed: (){}, 
                label: Text("Add Transaction")),
              ),
            
    ],
  )
  );
  }
}