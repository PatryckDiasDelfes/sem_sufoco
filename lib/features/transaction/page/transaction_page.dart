import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/transaction/widget/transaction_info_field.dart';
import 'package:sem_sufoco/shared/widget/elevated_botton.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // ============================================================
      // APP BAR
      // ============================================================
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Novo lançamento',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.help_outline, color: Color(0xFF00BFA5)),
          SizedBox(width: 16),
        ],
      ),

      // ============================================================
      // CONTEÚDO
      // ============================================================
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // ========================================================
            // CATEGORIA
            // ========================================================
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF0A2B20),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF124231)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.restaurant, color: Color(0xFF00BFA5), size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Alimentação',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.edit_outlined, color: Color(0xFF00BFA5), size: 18),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ========================================================
            // CARD - SOBRE A TRANSAÇÃO
            // ========================================================
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF111E18),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1B3026)),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ==================================================
                  // TÍTULO
                  // ==================================================
                  Text(
                    'Sobre a transação',
                    style: AppTextStyle.bodySmall.copyWith(
                      color: AppColors.white,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ==================================================
                  // DATA
                  // ==================================================
                  TransactionInfoField(
                    labelTitle: 'Data da transação',
                    icon: Icons.calendar_today_outlined,
                    onTap: () {},
                  ),

                  const SizedBox(height: 16),

                  // ==================================================
                  // HORÁRIO
                  // ==================================================
                  const TransactionInfoField(
                    labelTitle: 'Horário',
                    icon: Icons.access_time,
                  ),

                  const SizedBox(height: 16),

                  // ==================================================
                  // ESTABELECIMENTO
                  // ==================================================
                  const TransactionInfoField(
                    labelTitle: 'Estabelecimento',
                    icon: Icons.storefront_outlined,
                  ),

                  const SizedBox(height: 24),

                  // ==================================================
                  // VALOR
                  // ==================================================
                  const TransactionInfoField(
                    labelTitle: '0,00',
                    icon: Icons.attach_money,
                  ),

                  const SizedBox(height: 24),

                  // ==================================================
                  // DIVISOR
                  // ==================================================
                  const Divider(color: Color(0xFF1B3026)),

                  const SizedBox(height: 16),

                  // ==================================================
                  // DESCRIÇÃO
                  // ==================================================
                  Row(
                    children: [
                      const Icon(
                        Icons.receipt_long_outlined,
                        color: Color(0xFF00BFA5),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Text(
                          'Adicionar descrição',
                          style: AppTextStyle.bodySmall.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),

                      const Icon(Icons.chevron_right, color: AppColors.gray200),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 90),

            const AppElevatedButton(
              label: 'Salvar',
              type: ButtonType.outlined,
              backgroundColor: AppColors.colorsTheme,
            ),
          ],
        ),
      ),
    );
  }
}
