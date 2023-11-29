import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class mychart extends StatelessWidget {
  const mychart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: PieChart( swapAnimationDuration: Duration(seconds: 0),swapAnimationCurve: Curves.bounceIn,
                  PieChartData(
                    sections:[
                    PieChartSectionData(value: 200,title: "FOOD",color: Color.fromARGB(255, 92, 172, 162)),
                    PieChartSectionData(value: 350,title: "RECHARGE",color: Color.fromARGB(255, 151, 163, 169)),
                    PieChartSectionData(value: 150,title: "hello",color: Color.fromARGB(255, 55, 145, 139)),
         
                    ]),
                  ),
    );
         
  }
}