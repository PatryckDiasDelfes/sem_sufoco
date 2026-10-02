import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/home/widgets/app_card_category.dart';
import 'package:sem_sufoco/shared/mocks/transaction_mock.dart';

class CardCategorySetion extends StatelessWidget {
  const CardCategorySetion({super.key, required this.categories, this.limit});

  final List<Category> categories;
  final int? limit;

  @override
  Widget build(BuildContext context) {
    final displayedCategories = limit == null
        ? categories
        : categories.take(limit!).toList();

    return CarouselSlider.builder(
      itemCount: displayedCategories.length,
      itemBuilder: (context, index, realIndex) {
        final category = displayedCategories[index];

        // =========================
        // Total da categoria
        // =========================

        final price = mockTransactions
            .where(
              (transaction) =>
                  transaction.categoryId == category.id &&
                  transaction.type.name == 'expense',
            )
            .fold<double>(
              0,
              (total, transaction) => total + transaction.amount,
            );

        return GestureDetector(
          onTap: () {
            context.push('/CategoriesPage');
          },
          child: AppCardCategory(
            category: category.name,
            price: price,
            icon: Icon(category.icon, color: AppColors.white),
            color: AppColors.purple,
          ),
        );
      },
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.95,
        enlargeCenterPage: true,
        enlargeFactor: 0.05,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,

        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,

        scrollPhysics: const BouncingScrollPhysics(),
      ),
    );
  }
}
