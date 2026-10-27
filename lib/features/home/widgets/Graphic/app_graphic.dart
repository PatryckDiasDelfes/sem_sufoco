import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/home/controllers/GraphicController.dart';
import 'package:sem_sufoco/utils.dart';

class AppGraphic extends StatelessWidget {
  const AppGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GraphicController>(
      builder: (context, controller, _) {
        final interval = controller.interval;

        return BarChart(
          BarChartData(
            minY: 0,
            maxY: controller.maxY,
            alignment: BarChartAlignment.start,
            borderData: FlBorderData(
              show: true,
              border: const Border(
                top: BorderSide.none,
                left: BorderSide(color: AppColors.grenLive),
                bottom: BorderSide(color: AppColors.grenLive),
              ),
            ),
            gridData: FlGridData(
              horizontalInterval: interval,
              show: true,
              drawHorizontalLine: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) {
                return const FlLine(color: AppColors.gray100, strokeWidth: 1);
              },
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: 60,
                  showTitles: true,
                  interval: interval,
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      meta: meta,
                      child: Text(
                        Utils().formatCurrencyNoDouble(value),
                        style: const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                        ),
                      ),
                    );
                  },
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      meta: meta,
                      child: Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            barGroups: controller.groups
                .map((g) => RodsGroup(g.values.map(Rods).toList(), g.x))
                .toList(),
          ),
        );
      },
    );
  }

  BarChartGroupData RodsGroup(List<BarChartRodData> barRods, num numMes) =>
      BarChartGroupData(x: numMes.toInt(), barsSpace: 2, barRods: barRods);

  BarChartRodData Rods(double numMoney) {
    return BarChartRodData(
      toY: numMoney,
      color: AppColors.accent,
      width: 10,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(2),
        topRight: Radius.circular(2),
      ),
    );
  }
}
