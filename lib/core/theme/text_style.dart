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

  static const TextStyle subTitle = TextStyle(
    color: AppColors.white,
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

  static const TextStyle homeText = TextStyle(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle homeTextGren = TextStyle(
    color: AppColors.grenLive,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle extrectSub = TextStyle(
    color: AppColors.gray100,
    fontSize: 10,
  );
  static const TextStyle homePriceRed = TextStyle(
    color: AppColors.red,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle homePriceWhite = TextStyle(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle AppBartitle = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle AppBarsubTitle = TextStyle(
    color: AppColors.gray100,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}
