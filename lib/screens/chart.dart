import 'package:flutter/material.dart';

class chart extends StatefulWidget {
  const chart({super.key});

  @override
  State<chart> createState() => _chartState();
}

class _chartState extends State<chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CHART"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: Column(
          children: [
            // chart()
          ],
        ),
      ),
    );
  }
}