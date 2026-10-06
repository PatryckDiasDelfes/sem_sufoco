import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/categorie/widget/app_info_item.dart';

class AppLatestTransactionCard extends StatelessWidget {
  const AppLatestTransactionCard({
    super.key,
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
        color: AppColors.bg,
        border: Border.all(color: AppColors.cardGreen),
        boxShadow: const [
          BoxShadow(color: AppColors.shodownBox, blurRadius: 4),
        ],
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
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  border: Border.all(color: AppColors.cardGreen),
                  boxShadow: const [
                    BoxShadow(color: AppColors.shodownBox, blurRadius: 4),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Icon(category.icon, color: AppColors.accent, size: 25),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.establishment,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      category.name,
                      style: const TextStyle(
                        color: AppColors.white,
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
                  color: isExpense ? AppColors.red : AppColors.black,
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
              style: const TextStyle(color: AppColors.white, fontSize: 14),
            ),

            const SizedBox(height: 20),
          ],

          // =========================
          // Informações
          // =========================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppInfoItem(title: 'Local', value: transaction.establishment),

              AppInfoItem(
                title: 'Data',
                value:
                    '${transaction.purchasedAt.day.toString().padLeft(2, '0')}/'
                    '${transaction.purchasedAt.month.toString().padLeft(2, '0')}/'
                    '${transaction.purchasedAt.year}',
              ),

              AppInfoItem(
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
