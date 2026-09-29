import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppGraphic extends StatelessWidget {
  const AppGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: [
          RodsGroup([Rods(), Rods(), Rods()]),
          BarChartGroupData(
            x: 10,
            barsSpace: 20,
            barRods: [
              BarChartRodData(toY: 100, color: AppColors.pink),
              BarChartRodData(toY: 200, color: AppColors.pink),
              BarChartRodData(toY: 100, color: AppColors.pink),
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData RodsGroup(List<BarChartRodData> barRods) =>
      BarChartGroupData(x: 5, barsSpace: 20, barRods: barRods);

  BarChartRodData Rods() {
    return BarChartRodData(
      toY: 100,
      color: AppColors.pink,
      width: 20,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
    );
  }
}
