```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/transaction/widget/transaction_info_field.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  DateTime? dataSelecionada;
  TimeOfDay? horarioSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // ============================================================
      // APP BAR
      // ============================================================

      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: AppColors.white,
        title: Text(
          'Nova transação',
          style: AppTextStyle.titleMedium,
        ),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
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
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF123C2D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.restaurant_outlined,
                    color: Color(0xFF00BFA5),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      'Alimentação',
                      style: AppTextStyle.bodyMedium.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),

                  const Icon(
                    Icons.edit_outlined,
                    color: AppColors.gray200,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ========================================================
            // INFORMAÇÕES DA TRANSAÇÃO
            // ========================================================

            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF123C2D),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF1B3026),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobre a transação',
                    style: AppTextStyle.titleMedium.copyWith(
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

                    value: dataSelecionada == null
                        ? null
                        : DateFormat('dd/MM/yyyy')
                            .format(dataSelecionada!),

                    onTap: () async {
                      final data = await showDatePicker(
                        context: context,
                        initialDate:
                            dataSelecionada ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (data != null) {
                        setState(() {
                          dataSelecionada = data;
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 16),

                  // ==================================================
                  // HORÁRIO
                  // ==================================================

                  TransactionInfoField(
                    labelTitle: 'Horário',
                    icon: Icons.access_time,
                    value: horarioSelecionado?.format(context),

                    onTap: () async {
                      final horario = await showTimePicker(
                        context: context,
                        initialTime:
                            horarioSelecionado ?? TimeOfDay.now(),
                      );

                      if (horario != null) {
                        setState(() {
                          horarioSelecionado = horario;
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 16),

                  // ==================================================
                  // ESTABELECIMENTO
                  // ==================================================

                  TransactionInfoField(
                    labelTitle: 'Estabelecimento',
                    icon: Icons.storefront_outlined,
                    value: null,
                    onTap: () {},
                  ),

                  const SizedBox(height: 24),

                  const Divider(
                    color: Color(0xFF1B3026),
                  ),

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
                          style: AppTextStyle.bodyMedium.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),

                      const Icon(
                        Icons.chevron_right,
                        color: AppColors.gray200,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
```
