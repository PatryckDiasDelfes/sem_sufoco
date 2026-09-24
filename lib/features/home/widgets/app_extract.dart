import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

import 'package:sem_sufoco/features/home/widgets/app_extract_head.dart';
import 'package:sem_sufoco/features/home/widgets/app_line.dart';
import 'package:sem_sufoco/features/home/widgets/app_spend.dart';

class AppExtract extends StatelessWidget {
  const AppExtract({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardGreen, width: 1),
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shodownBox,
            blurRadius: 8, // O desfoque da sombra
            spreadRadius: 1, // O quanto a sombra se espalha
          ),
        ],
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),

        child: const Column(
          children: [
            AppExtractHead(),
            AppLine(size: 1.3),
            AppSpend(
              name: 'Supermercado',
              category: 'Alimentação',
              price: -12,
              date: '7 de julho',
              icone: Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.tertiary,
              ),
            ),
            AppSpend(
              name: 'Faculdade',
              category: 'Estudos',
              price: -1900,
              date: '6 de julho',
              icone: Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.tertiary,
              ),
            ),
            AppSpend(
              name: 'Shopping',
              category: 'Lazer',
              price: -452,
              date: '5 de julho',
              icone: Icon(Icons.mobile_friendly, color: AppColors.tertiary),
            ),
          ],
        ),
      ),
    );
  }
}
