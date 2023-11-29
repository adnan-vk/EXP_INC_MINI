import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("DETAILS"),
        backgroundColor: const Color.fromARGB(255, 3, 45, 79),
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
                padding: const EdgeInsets.only(
                  top: 50,
                  bottom: 50,
                  left: 25,right: 25
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                
                child: const Column(
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