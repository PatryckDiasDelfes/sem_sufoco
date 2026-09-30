import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppGraphic extends StatelessWidget {
  const AppGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 40,
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  meta: meta,
                  child: Text(
                    value.toInt().toString(),
                    style: TextStyle(
                      color: Colors.white, // ---> Cor dos números do eixo X
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
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
      gradient: LinearGradient(
        colors: [AppColors.pink, AppColors.pink.withOpacity(0.5)],
      ),
      width: 20,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      backDrawRodData: BackgroundBarChartRodData(
        show: true,
        toY: 200,
        color: AppColors.white.withOpacity(0.2),
      ),
    );
  }
}
