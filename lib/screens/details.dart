import 'package:flutter/material.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DETAILS"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: 50,
                  bottom: 50,
                  left: 25,right: 25
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ITEM",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      Column(
                        children: [
                          Text("Salary",style: TextStyle(fontWeight: FontWeight.w400),),
                          Text("Get The Salary"),
                        ],
                      )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                        Text("05-01-2023"),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Amount",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                        Text("50000"),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
        
    );
  }
}