import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppIconStackUpGraphic extends StatelessWidget {
  const AppIconStackUpGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.bar_chart, color: AppColors.white),
        Icon(Icons.trending_up, color: AppColors.grenLive),
      ],
    );
  }
}
