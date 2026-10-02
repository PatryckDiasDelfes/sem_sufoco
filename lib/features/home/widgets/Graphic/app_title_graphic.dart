import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';

class AppTitleGraphic extends StatelessWidget {
  const AppTitleGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          spacing: 20,
          children: [
            Icon(Icons.wallet_outlined, color: AppColors.accent),
            Text(
              'Saldo atual',
              style: TextStyle(color: AppColors.white, fontSize: 12),
            ),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            Text('R\$ 2.000,00', style: AppTextStyle.subTitle),
            Icon(Icons.remove_red_eye_outlined, color: AppColors.white),
          ],
        ),
        Row(
          spacing: 5,
          children: [
            Icon(Icons.arrow_outward_rounded, color: AppColors.accent),
            Text(
              '+12%',
              style: TextStyle(
                color: AppColors.accent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'em relação ao mês anterior',
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}
