import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppLine extends StatelessWidget {
  const AppLine({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,

      width: MediaQuery.of(context).size.width / size,
      decoration: const BoxDecoration(
        color: AppColors.cardGreen,
        boxShadow: [
          BoxShadow(
            color: AppColors.shodownBox,
            blurRadius: 20, // O desfoque da sombra
            spreadRadius: 0.5, // O quanto a sombra se espalha
          ),
        ],
      ),
    );
  }
}
