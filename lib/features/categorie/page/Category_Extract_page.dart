import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/home/widgets/app_spend.dart';
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
          backgroundColor: Colors.black,

          // =========================
          // AppBar
          // =========================
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            title: Text(
              category.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
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
                            Text(
                              totalAmount < 0
                                  ? '- ${_formatMoney(totalAmount.abs())}'
                                  : '+ ${_formatMoney(totalAmount)}',
                              style: TextStyle(
                                color: totalAmount < 0
                                    ? Colors.red
                                    : Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              category.name.toUpperCase(),
                              style: const TextStyle(
                                color: AppColors.primary,
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
                      Container(
                        width: 58,
                        height: 58,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          category.icon,
                          color: Colors.black,
                          size: 31,
                        ),
                      ),
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
                    _LatestTransactionCard(
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
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
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
                            priceColor:
                                transaction.type == TransactionType.income
                                ? AppColors.grenLive
                                : AppColors.danger,
                          ),
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

  String _formatMoney(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }
}

// =========================
// Card da transação mais recente
// =========================

class _LatestTransactionCard extends StatelessWidget {
  const _LatestTransactionCard({
    required this.transaction,
    required this.category,
  });

  final Transaction transaction;
  final Category category;

  @override
  Widget build(BuildContext context) {
    final isExpense = transaction.type == TransactionType.expense;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF55C9A7),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =========================
          // Cabeçalho
          // =========================
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(category.icon, color: Colors.white, size: 25),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.establishment,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      category.name,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                isExpense
                    ? '- ${_formatMoney(transaction.amount)}'
                    : '+ ${_formatMoney(transaction.amount)}',
                style: TextStyle(
                  color: isExpense ? Colors.red : Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // =========================
          // Descrição
          // =========================
          if (transaction.description.isNotEmpty) ...[
            Text(
              transaction.description,
              style: const TextStyle(color: Colors.black87, fontSize: 14),
            ),

            const SizedBox(height: 20),
          ],

          // =========================
          // Informações
          // =========================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _InfoItem(title: 'Local', value: transaction.establishment),

              _InfoItem(
                title: 'Data',
                value:
                    '${transaction.purchasedAt.day.toString().padLeft(2, '0')}/'
                    '${transaction.purchasedAt.month.toString().padLeft(2, '0')}/'
                    '${transaction.purchasedAt.year}',
              ),

              _InfoItem(
                title: 'Hora',
                value:
                    '${transaction.purchasedAt.hour.toString().padLeft(2, '0')}:'
                    '${transaction.purchasedAt.minute.toString().padLeft(2, '0')}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // =========================
  // Formatar dinheiro
  // =========================

  String _formatMoney(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }
}

// =========================
// Informações
// =========================

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 3),

        Text(
          value,
          style: const TextStyle(color: Colors.black54, fontSize: 11),
        ),
      ],
    );
  }
}
