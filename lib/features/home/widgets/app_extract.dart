import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/home/widgets/app_extract_head.dart';
import 'package:sem_sufoco/features/home/widgets/app_line.dart';
import 'package:sem_sufoco/features/home/widgets/app_spend.dart';
import 'package:sem_sufoco/shared/mocks/category_mock.dart';
import 'package:sem_sufoco/shared/mocks/transaction_mock.dart';

class AppExtract extends StatelessWidget {
  const AppExtract({super.key, this.limit});
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
          const AppExtractHead(),
          const AppLine(size: 1.3),

          SizedBox(height: 16),

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
                icone: Icon(category.icon, color: AppColors.tertiary),
              ),
            );
          }),
        ],
      ),
    );
  }
}
