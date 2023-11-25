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
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search"
              ),
            ),
            Text("Current Balance"),
            Text("9974",style: TextStyle(fontSize: 30),),
            ListView.builder(itemBuilder: (context, index) {
              Card(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Salary"),
                        Text("Get the salary"),
                      ],
                    ),
                    Column(
                      children: [
                        Text("50000"),
                        Text("05-01-2023"),
                      ],
                    )
                  ],
                ),
              );
            },
            itemCount: 10,
            )
          ],
        ),
      ),
      );
  }
}