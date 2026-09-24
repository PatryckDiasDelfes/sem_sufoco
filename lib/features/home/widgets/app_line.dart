import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppLine extends StatelessWidget {
  const AppLine({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: AppColors.cardGreen,
      width: MediaQuery.of(context).size.width / size,
    );
  }
}
