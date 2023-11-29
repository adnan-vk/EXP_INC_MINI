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
        child: PieChart( swapAnimationDuration: const Duration(seconds: 0),swapAnimationCurve: Curves.bounceIn,
                    PieChartData(
                      sections:[
                      PieChartSectionData(value: 200,title: "FOOD",color: Color.fromARGB(255, 184, 67, 20)),
                      PieChartSectionData(value: 350,title: "RECHARGE",color: Color.fromARGB(255, 243, 236, 184)),
                      PieChartSectionData(value: 150,title: "hello",color: Color.fromARGB(255, 148, 207, 150)),
           
                      ]),
                    ),
      ),
    );
         
  }
}