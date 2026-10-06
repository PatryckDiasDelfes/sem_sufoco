import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppCategoryIcon extends StatelessWidget {
  const AppCategoryIcon({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: const BoxDecoration(
        color: AppColors.bg,
        shape: BoxShape.circle,
      ),
      child: Icon(category.icon, color: AppColors.accent, size: 31),
    );
  }
}
