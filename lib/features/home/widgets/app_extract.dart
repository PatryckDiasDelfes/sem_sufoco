import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/home/widgets/app_extract_head.dart';
import 'package:sem_sufoco/features/home/widgets/app_line.dart';
import 'package:sem_sufoco/features/home/widgets/app_spend.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';
import 'package:sem_sufoco/shared/mocks/category_mock.dart';

class AppExtract extends StatelessWidget {
  const AppExtract({
    super.key,
    this.limit,
    this.pageController,
    this.controller,
  });

  final PageController? pageController;
  final NotchBottomBarController? controller;
  final int? limit;

  @override
  Widget build(BuildContext context) {
    // =========================
    // Transações
    // =========================

    final transactionController = context.watch<TransactionController>();

    final transactions = limit == null
        ? transactionController.transactions
        : transactionController.transactions.take(limit!).toList();

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
          // =========================
          // Cabeçalho
          // =========================
          AppExtractHead(
            controller: controller!,
            pageController: pageController!,
          ),

          const AppLine(size: 1.3),

          // =========================
          // Transações
          // =========================
          ...transactions.map((transaction) {
            final category = mockCategories.firstWhere(
              (category) => category.id == transaction.categoryId,
            );

            // =========================
            // Tipo da transação
            // =========================

            final isIncome = transaction.type == TransactionType.income;

            return GestureDetector(
              onTap: () {
                context.push('/ReleaseDetailsPage', extra: transaction);
              },
              child: AppSpend(
                name: transaction.establishment,
                category: category.name,
                price: transaction.amount,

                // =========================
                // Cor do valor
                // =========================
                priceColor: isIncome ? AppColors.grenLive : AppColors.danger,

                // =========================
                // Data
                // =========================
                date:
                    '${transaction.purchasedAt.day.toString().padLeft(2, '0')}/'
                    '${transaction.purchasedAt.month.toString().padLeft(2, '0')}/'
                    '${transaction.purchasedAt.year}',

                // =========================
                // Ícone
                // =========================
                icone: Icon(category.icon),
                type: transaction.type,
              ),
            );
          }),
        ],
      ),
    );
  }
}
