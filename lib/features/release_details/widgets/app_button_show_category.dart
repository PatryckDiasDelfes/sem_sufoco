import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppButtonShowCategory extends StatelessWidget {
  const AppButtonShowCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shodownBox,
            blurRadius: 4, // O desfoque da sombra
            // O quanto a sombra se espalha
          ),
        ],

        border: Border.all(color: AppColors.cardGreen),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.restaurant, color: AppColors.accent, size: 18),
          SizedBox(width: 8),
          Text(
            'Alimentação',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.edit_outlined, color: AppColors.accent, size: 18),
        ],
      ),
    );
  }
}
