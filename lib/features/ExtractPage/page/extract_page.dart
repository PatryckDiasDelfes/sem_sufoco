import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';
import 'package:sem_sufoco/features/categorie/controller/category_controller.dart';

class ExtractPage extends StatelessWidget {
  const ExtractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionController>(
      builder: (context, transactionController, child) {
        // =========================
        // Transações
        // =========================

        final transactionsList = transactionController.transactions;

        // =========================
        // Receitas
        // =========================

        final incomes =
            transactionsList
                .where(
                  (transaction) => transaction.type == TransactionType.income,
                )
                .toList()
              ..sort((a, b) => b.purchasedAt.compareTo(a.purchasedAt));

        // =========================
        // Despesas
        // =========================

        final expenses =
            transactionsList
                .where(
                  (transaction) => transaction.type == TransactionType.expense,
                )
                .toList()
              ..sort((a, b) => b.purchasedAt.compareTo(a.purchasedAt));

        // =========================
        // Lista de transações
        // =========================

        final transactions = [...incomes, ...expenses];

        // =========================
        // Saldo
        // =========================

        final balance = transactionsList.fold<double>(0, (total, transaction) {
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
                      style: AppTextStyle.bodySmall.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'R\$ ${balance.toStringAsFixed(2)}',
                      style: AppTextStyle.title.copyWith(
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
                child: Consumer<CategoryController>(
                  builder: (context, categoryController, child) {
                    final categories = categoryController.categories;

                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];

                        // Busca a categoria carregada pelo Supabase.
                        final matchingCategories = categories.where(
                          (category) => category.id == transaction.categoryId,
                        );

                        final category = matchingCategories.isNotEmpty
                            ? matchingCategories.first
                            : null;

                        final isIncome =
                            transaction.type == TransactionType.income;

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
                                  category?.icon ?? Icons.category,
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
                                      category?.name ??
                                          'Categoria não encontrada',
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
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
