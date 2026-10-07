import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/categorie/widget/app_category_extrect.dart';
import 'package:sem_sufoco/features/categorie/widget/app_category_icon.dart';
import 'package:sem_sufoco/features/categorie/widget/app_latest_transaction_card.dart';
import 'package:sem_sufoco/features/categorie/widget/app_money_title.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';

class CategoryExtractPage extends StatelessWidget {
  const CategoryExtractPage({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionController>(
      builder: (context, controller, child) {
        // =========================
        // Transações da categoria
        // =========================

        final transactions =
            controller.transactions
                .where((transaction) => transaction.categoryId == category.id)
                .toList()
              ..sort((a, b) => b.purchasedAt.compareTo(a.purchasedAt));

        // =========================
        // Total da categoria
        // =========================

        final totalAmount = _totalAmount(transactions);

        return Scaffold(
          backgroundColor: AppColors.backGround,

          // =========================
          // AppBar
          // =========================
          appBar: AppBar(
            backgroundColor: AppColors.backGround,
            elevation: 0,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
            ),
            title: Text(
              category.name,
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
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // =========================
                  // Resumo
                  // =========================
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppMoneyTitle(totalAmount: totalAmount),

                            const SizedBox(height: 5),

                            Text(
                              category.name.toUpperCase(),
                              style: const TextStyle(
                                color: AppColors.accent,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // =========================
                      // Ícone
                      // =========================
                      AppCategoryIcon(category: category),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // =========================
                  // Transações
                  // =========================
                  if (transactions.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          'Nenhuma transação nesta categoria.',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ),
                    )
                  else ...[
                    // =========================
                    // Transação mais recente
                    // =========================
                    AppLatestTransactionCard(
                      transaction: transactions.first,
                      category: category,
                    ),

                    // =========================
                    // Demais transações
                    // =========================
                    if (transactions.length > 1) ...[
                      const SizedBox(height: 28),

                      const Text(
                        'Transações anteriores',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 14),

                      ...transactions.skip(1).map((transaction) {
                        return AppCategoryExtrect(
                          category: category,
                          transaction: transaction,
                        );
                      }),
                    ],
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // =========================
  // Somar transações
  // =========================

  double _totalAmount(List<Transaction> transactions) {
    return transactions.fold(0, (total, transaction) {
      if (transaction.type == TransactionType.expense) {
        return total - transaction.amount;
      }

      return total + transaction.amount;
    });
  }

  // =========================
  // Formatar dinheiro
  // =========================
}
