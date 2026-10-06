import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';

import 'package:sem_sufoco/features/home/widgets/Graphic/app_calendar_graphic.dart';

import 'package:sem_sufoco/features/home/widgets/Graphic/app_title_graphic.dart';

import 'package:sem_sufoco/features/home/widgets/Graphic/app_graphic.dart';

class AppGraphicSetion extends StatelessWidget {
  const AppGraphicSetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.bg,
        border: Border.all(color: AppColors.cardGreen, width: 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: AppColors.shodownBox, blurRadius: 4),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 103,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: AppTitleGraphic()),
                  AppCalendarGraphic(),
                ],
              ),
            ),
            SizedBox(height: 105, child: AppGraphic()),
          ],
        ),
      ),
    );
  }
}
