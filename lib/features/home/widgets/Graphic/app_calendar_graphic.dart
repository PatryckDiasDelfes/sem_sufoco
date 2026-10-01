import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppCalendarGraphic extends StatelessWidget {
  const AppCalendarGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bg,
          border: Border.all(width: 1, color: AppColors.cardGreen),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shodownBox,
              blurRadius: 4, // O desfoque da sombra
              // O quanto a sombra se espalha
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(6.0),
          child: Row(
            spacing: 5,
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: AppColors.white,
                size: 20,
              ),
              Text('Julho', style: TextStyle(color: AppColors.white)),
              Icon(
                Icons.arrow_downward_rounded,
                color: AppColors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
