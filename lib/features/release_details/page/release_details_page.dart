import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/release_details/widgets/app_button_show_category.dart';
import 'package:sem_sufoco/features/release_details/widgets/app_about_transison.dart';
import 'package:sem_sufoco/features/release_details/widgets/app_release_details_icon.dart';
import 'package:sem_sufoco/shared/mocks/category_mock.dart';

class ReleaseDetailsPage extends StatelessWidget {
  const ReleaseDetailsPage({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final category = mockCategories.firstWhere(
      (category) => category.id == transaction.categoryId,
    );

    final isIncome = transaction.type == TransactionType.income;

    return Scaffold(
      backgroundColor: AppColors.backGround,

      // =========================
      // AppBar
      // =========================
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
        ),
        title: Text(
          isIncome ? 'Receita recebida' : 'Saída',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),

      // =========================
      // Conteúdo
      // =========================
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),

            AppReleaseDetailsIcon(icon: category.icon),

            const SizedBox(height: 24),

            Text(
              '${isIncome ? '+' : '-'} '
              'R\$ ${transaction.amount.toStringAsFixed(2).replaceAll('.', ',')}',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: isIncome ? Colors.green : Colors.red,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              transaction.establishment,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 24),

            AppButtonShowCategory(category: category.name, icon: category.icon),

            const SizedBox(height: 32),

            AppAboutTransison(transaction: transaction),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
