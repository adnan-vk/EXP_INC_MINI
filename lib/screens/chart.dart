import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatelessWidget {
  const MyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CHART"),
        backgroundColor: const Color.fromARGB(255, 3, 45, 79),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(50),
        child: PieChart( 
                    PieChartData(
                      sections:[
                      PieChartSectionData(value: 40,title: "FOOD",color: const Color.fromARGB(255, 184, 67, 20)),
                      PieChartSectionData(value: 35,title: "RECHARGE",color: const Color.fromARGB(255, 243, 236, 184)),
                      PieChartSectionData(value: 25,title: "hello",color: const Color.fromARGB(255, 148, 207, 150)),
           
                      ]),
                    ),
      ),
    );
         
  }
}