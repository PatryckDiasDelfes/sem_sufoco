import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.labelTitle, required this.icon});

  final String labelTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              //color: AppColors.backgroundBackup,
              border: Border.all(color: AppColors.backgroundBackup, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon, color: Colors.white, size: 30),
                Text(
                  labelTitle,
                  style: const TextStyle(
                    color: AppColors.gray100,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
