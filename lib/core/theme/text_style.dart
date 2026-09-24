import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppTextStyle {
  static const TextStyle headingLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headingSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle inputLabel = TextStyle(
    color: AppColors.gray200,
    fontSize: 15,
  );

  static const TextStyle subTitle = TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle price = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonLabel = TextStyle(color: AppColors.white);

  static TextStyle? get smallBlack => null;
}
