import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/core/model/transaction.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/home/widgets/app_line.dart';
import 'package:sem_sufoco/features/home/widgets/app_spend.dart';
import 'package:sem_sufoco/shared/mocks/category_mock.dart';
import 'package:sem_sufoco/shared/mocks/transaction_mock.dart';

class AppCategoryExtract extends StatelessWidget {
  AppCategoryExtract({super.key, this.limit});

  final int? limit;

  @override
  Widget build(BuildContext context) {
    final transactions = limit == null
        ? mockTransactions
        : mockTransactions.take(limit!).toList();
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardGreen),
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: AppColors.shodownBox, blurRadius: 4),
        ],
      ),
      child: Column(
        children: [
          Column(
            children: [
              const AppLine(size: 1.3),

              ...transactions.map((transaction) {
                final category = mockCategories.firstWhere(
                  (category) => category.id == transaction.categoryId,
                );

                return GestureDetector(
                  onTap: () {
                    context.push('/ReleaseDetailsPage', extra: transaction);
                  },
                  child: AppSpend(
                    name: transaction.establishment,
                    category: category.name,
                    price: transaction.amount,

                    date:
                        '${transaction.purchasedAt.day} de '
                        '${transaction.purchasedAt.month}',

                    // Ícone sempre preto
                    icone: Icon(category.icon, color: Colors.black),

                    // Somente o valor muda de cor
                    priceColor: transaction.type == TransactionType.income
                        ? AppColors.grenLive
                        : AppColors.danger,
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
