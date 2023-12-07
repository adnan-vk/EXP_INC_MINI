import 'package:flutter/material.dart';
import 'package:mini/screens/edit.dart';

class Details extends StatefulWidget {
  final String decr;
  final String type;
  final String amount;
  final String date;
  final int index;
  
  const Details({super.key, 
  required this.decr, 
  required this.type, 
  required this.amount, 
  required this.date, 
  required this.index});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   decr.text = widget.decr;
  //   .text = widget.decr;
  //   decr.text = widget.decr;
  //   decr.text = widget.decr;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("DETAILS"),
        backgroundColor:  const Color.fromARGB(255, 3, 45, 79),
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
                
                child:  Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("ITEM",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      Column(
                        children: [
                          Text(widget.decr,style: TextStyle(fontWeight: FontWeight.w400),),
                        ],
                      )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                        Text(widget.date),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Amount",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                        Text(widget.amount),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Type",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                        Text(widget.type,style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: widget.type == 'INCOME'? Colors.green : widget.type == "EXPENCE"? Colors.red : Colors.black),),
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