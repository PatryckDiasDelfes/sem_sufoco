import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/categorie/controller/category_controller.dart';
import 'package:sem_sufoco/features/release_details/controller/release_details_controller.dart';
import 'package:sem_sufoco/features/release_details/widgets/app_button_show_category.dart';
import 'package:sem_sufoco/features/release_details/widgets/app_about_transison.dart';
import 'package:sem_sufoco/features/release_details/widgets/app_release_details_icon.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';

class ReleaseDetailsPage extends StatelessWidget {
  const ReleaseDetailsPage({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final detailsController = context.watch<ReleaseDetailsController>();
    final transactionController = context.watch<TransactionController>();
    final categoryController = context.watch<CategoryController>();

    // =========================
    // Transação Atualizada
    // =========================

    final currentTransaction = detailsController.getCurrentTransaction(
      transaction: transaction,
      transactionController: transactionController,
    );

    // =========================
    // Categoria
    // =========================

    final category = categoryController.getById(currentTransaction.categoryId);

    final categoryIcon = category?.icon ?? Icons.category_outlined;
    final categoryName = category?.name ?? 'Categoria não encontrada';

    // =========================
    // Tipo da Transação
    // =========================

    final isIncome = currentTransaction.type == TransactionType.income;

    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: context.pop,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),

            AppReleaseDetailsIcon(icon: categoryIcon),

            const SizedBox(height: 24),

            Text(
              '${isIncome ? '+' : '-'} '
              'R\$ ${currentTransaction.amount.toStringAsFixed(2).replaceAll('.', ',')}',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: isIncome ? Colors.green : Colors.red,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              currentTransaction.establishment,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 24),

            AppButtonShowCategory(category: categoryName, icon: categoryIcon),

            const SizedBox(height: 32),

            AppAboutTransison(transaction: currentTransaction),

            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.push(
                      '/EditTransactionPage',
                      extra: currentTransaction,
                    );
                  },
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('Editar lançamento'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
