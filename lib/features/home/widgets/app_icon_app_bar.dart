import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppIconAppBar extends StatelessWidget {
  const AppIconAppBar({
    super.key,
    required this.numPadding,
    required this.icon,
  });

  final double numPadding;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: numPadding),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardGreen,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.shodownBox),
        ),
        child: icon,
      ),
    );
  }
}
