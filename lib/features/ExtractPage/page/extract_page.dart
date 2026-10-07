import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/shared/mocks/category_mock.dart';
import 'package:sem_sufoco/shared/mocks/transaction_mock.dart';

class ExtractPage extends StatelessWidget {
  const ExtractPage({super.key});

  @override
  Widget build(BuildContext context) {
    // =========================
    // Receitas
    // =========================

    final incomes = mockTransactions
        .where((transaction) => transaction.type == TransactionType.income)
        .toList();

    // =========================
    // Saídas
    // =========================

    final expenses =
        mockTransactions
            .where((transaction) => transaction.type == TransactionType.expense)
            .toList()
          ..sort((a, b) => b.purchasedAt.compareTo(a.purchasedAt));

    // =========================
    // Transações
    // =========================

    final transactions = [...incomes, ...expenses];

    // =========================
    // Saldo
    // =========================

    final balance = mockTransactions.fold<double>(0, (total, transaction) {
      if (transaction.type == TransactionType.income) {
        return total + transaction.amount;
      }

      return total - transaction.amount;
    });

    return Scaffold(
      backgroundColor: AppColors.background,

      // =========================
      // AppBar
      // =========================
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: Colors.white,
        title: Text('Extrato', style: AppTextStyle.title),
      ),

      // =========================
      // Conteúdo
      // =========================
      body: Column(
        children: [
          // =========================
          // Saldo
          // =========================
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.backGround,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo',
                  style: AppTextStyle.bodySmall.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  'R\$ ${balance.toStringAsFixed(2)}',
                  style: AppTextStyle.title!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // =========================
          // Lista de transações
          // =========================
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];

                final category = mockCategories.firstWhere(
                  (category) => category.id == transaction.categoryId,
                );

                final isIncome = transaction.type == TransactionType.income;

                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backGround,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      // =========================
                      // Ícone
                      // =========================
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppColors.bg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          category.icon,
                          color: isIncome
                              ? AppColors.primary
                              : AppColors.tertiary,
                        ),
                      ),

                      const SizedBox(width: 12),

                      // =========================
                      // Informações
                      // =========================
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction.establishment,
                              style: AppTextStyle.bodySmall.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              category.name,
                              style: AppTextStyle.bodySmall.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // =========================
                      // Valor
                      // =========================
                      Column(
                        children: [
                          Text(
                            '${isIncome ? '+' : '-'} '
                            'R\$ ${transaction.amount.toStringAsFixed(2)}',
                            style: AppTextStyle.headingSmall.copyWith(
                              color: isIncome
                                  ? AppColors.primary
                                  : Colors.redAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${transaction.purchasedAt.day.toString().padLeft(2, '0')}/'
                            '${transaction.purchasedAt.month.toString().padLeft(2, '0')}/'
                            '${transaction.purchasedAt.year}',
                            style: AppTextStyle.inputLabel.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
