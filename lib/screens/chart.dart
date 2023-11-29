import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatelessWidget {
  const MyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CHART"),
        backgroundColor: Color.fromARGB(255, 3, 45, 79),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(50),
        child: PieChart( swapAnimationDuration: const Duration(seconds: 0),swapAnimationCurve: Curves.bounceIn,
                    PieChartData(
                      sections:[
                      PieChartSectionData(value: 200,title: "FOOD",color: const Color.fromARGB(255, 92, 172, 162)),
                      PieChartSectionData(value: 350,title: "RECHARGE",color: const Color.fromARGB(255, 151, 163, 169)),
                      PieChartSectionData(value: 150,title: "hello",color: const Color.fromARGB(255, 55, 145, 139)),
           
                      ]),
                    ),
      ),
    );
         
  }
}