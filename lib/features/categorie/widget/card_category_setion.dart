import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/home/widgets/app_card_category.dart';

class CardCategorySetion extends StatelessWidget {
  const CardCategorySetion({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        GestureDetector(
          onTap: () {
            context.push('/GastosCategoria');
          },
          child: const AppCardCategory(
            category: 'Alimentação',
            price: 850,
            icon: Icon(Icons.food_bank_outlined, color: AppColors.white),
            color: AppColors.purple,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.push('/GastosCategoria');
          },
          child: const AppCardCategory(
            category: 'Lazer',
            price: 900,
            icon: Icon(Icons.shopping_cart_outlined, color: AppColors.white),
            color: AppColors.pink,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.push('/GastosCategoria');
          },
          child: const AppCardCategory(
            category: 'Estudos',
            price: 2000,
            icon: Icon(Icons.school_outlined, color: AppColors.white),
            color: AppColors.yellow,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.push('/GastosCategoria');
          },
          child: const AppCardCategory(
            category: 'Moradia',
            price: 1500,
            icon: Icon(Icons.home_outlined, color: AppColors.white),
            color: AppColors.blue,
          ),
        ),
      ],
    );
  }
}
