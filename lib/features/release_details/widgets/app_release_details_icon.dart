import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppReleaseDetailsIcon extends StatelessWidget {
  const AppReleaseDetailsIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bg,
        border: Border.all(color: AppColors.cardGreen, width: 1),
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: AppColors.shodownBox, blurRadius: 4),
        ],
      ),
      child: Icon(icon, color: AppColors.accent, size: 32),
    );
  }
}
