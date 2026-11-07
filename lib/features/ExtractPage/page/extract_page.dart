import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/ExtractPage/controller/extract_controller.dart';

class ExtractPage extends StatelessWidget {
  const ExtractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExtractController>(
      builder: (context, controller, child) {
        final transactions = controller.transactions;

        return Scaffold(
          backgroundColor: AppColors.background,

          // =========================
          // AppBar
          // =========================
          appBar: AppBar(
            backgroundColor: AppColors.background,
            foregroundColor: Colors.white,
            title: const Text('Extrato', style: AppTextStyle.title),
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
                      controller.formatCurrency(controller.balance),
                      style: AppTextStyle.title.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // =========================
              // Lista de Transações
              // =========================
              Expanded(
                child: RefreshIndicator(
                  onRefresh: controller.refresh,
                  child: Builder(
                    builder: (context) {
                      if (controller.isLoading && controller.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (controller.errorMessage != null &&
                          controller.isEmpty) {
                        return ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            const SizedBox(height: 100),
                            Center(
                              child: Text(
                                controller.errorMessage!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      }

                      if (transactions.isEmpty) {
                        return ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: const [
                            SizedBox(height: 100),
                            Center(
                              child: Text(
                                'Nenhuma transação encontrada.',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        );
                      }

                      return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = transactions[index];

                          final category = controller.getCategory(
                            transaction.categoryId,
                          );

                          final isIncome =
                              transaction.type == TransactionType.income;

                          // =========================
                          // Item da Transação
                          // =========================

                          return InkWell(
                            borderRadius: BorderRadius.circular(16),

                            onTap: () {
                              context.push(
                                '/ReleaseDetailsPage',
                                extra: transaction,
                              );
                            },

                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.backGround,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  // Ícone da categoria
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

                                  // Informações da transação
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          transaction.establishment,
                                          style: AppTextStyle.bodySmall
                                              .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),

                                        const SizedBox(height: 4),

                                        Text(
                                          category?.name ??
                                              'Categoria não encontrada',
                                          style: AppTextStyle.bodySmall
                                              .copyWith(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Valor e data
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${isIncome ? '+' : '-'} '
                                        '${controller.formatCurrency(transaction.amount)}',
                                        style: AppTextStyle.headingSmall
                                            .copyWith(
                                              color: isIncome
                                                  ? AppColors.primary
                                                  : Colors.redAccent,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),

                                      Text(
                                        controller.formatDate(
                                          transaction.purchasedAt,
                                        ),
                                        style: AppTextStyle.inputLabel.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
