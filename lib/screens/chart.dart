
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mini/db/function/function.dart';

class MyChart extends StatelessWidget {
   MyChart({super.key});
List Trans = transactionListNotifier.value;
 final List<Color> sectionColors = [
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CHART"),
        backgroundColor: const Color.fromARGB(255, 3, 45, 79),
      ),
      body:
      ValueListenableBuilder(
    valueListenable: transactionListNotifier,
    builder: (context, value, child) {
      return SizedBox(
        height: 500,
        child: PieChart(
          PieChartData(
            sections: List.generate(
              Trans.length,
              (index) {
                double cost = double.parse(Trans[index].amount);
                double totalCost = calculateTotalCost(value);
                double percentage = (cost / totalCost) * 100;
                final name = Trans[index].discription;

                return PieChartSectionData(
                  badgePositionPercentageOffset: 1.1,
                  titlePositionPercentageOffset: .4,
                  color: sectionColors[index],
                  value: percentage,
                  title: 
                  ''' $name
  (${percentage.toStringAsFixed(2)}%)
  ₹ ${cost.toStringAsFixed(2)}
''',
                  radius: 80,
                  titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                );
              },
            ),
            sectionsSpace: 5,
            centerSpaceRadius: 90,
            startDegreeOffset: 0,
          ),
        ),
      );
    },
  )
);    
}
}