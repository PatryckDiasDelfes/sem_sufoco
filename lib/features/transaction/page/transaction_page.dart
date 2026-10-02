import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';
import 'package:sem_sufoco/features/transaction/widget/category_selector.dart';
import 'package:sem_sufoco/features/transaction/widget/transaction_info_field.dart';
import 'package:sem_sufoco/shared/mocks/category_mock.dart';
import 'package:sem_sufoco/shared/widget/elevated_botton.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  // =========================
  // Controllers dos campos
  // =========================

  final TextEditingController establishmentController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  Future<void> _selectDate() async {
    await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );
  }

  Future<void> _selectTime() async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  void dispose() {
    establishmentController.dispose();
    amountController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransactionController(),

      // =========================
      // Consumer
      // =========================
      child: Consumer<TransactionController>(
        builder: (context, controller, child) {
          return Scaffold(
            backgroundColor: Colors.black,

            // ============================================================
            // AppBar
            // ============================================================
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              title: const Text(
                'Novo lançamento',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              actions: const [
                Icon(Icons.camera_outlined, color: Color(0xFF00BFA5)),
                SizedBox(width: 16),
              ],
            ),

            // ============================================================
            // Conteúdo
            // ============================================================
            body: Column(
              children: [
                const SizedBox(height: 16),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
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
                          // Título
                          // ==================================================
                          Text(
                            'Sobre a transação',
                            style: AppTextStyle.bodySmall.copyWith(
                              color: AppColors.white,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // ==================================================
                          // Data
                          // ==================================================
                          Row(
                            children: [
                              Expanded(
                                child: TransactionInfoField(
                                  labelTitle: 'Data',
                                  icon: Icons.calendar_today_outlined,
                                  readOnly: true,
                                  onTap: _selectDate,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TransactionInfoField(
                                  labelTitle: 'Horário',
                                  icon: Icons.access_time,
                                  readOnly: true,
                                  onTap: _selectTime,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // ==================================================
                          // Estabelecimento
                          // ==================================================
                          TransactionInfoField(
                            labelTitle: 'Estabelecimento',
                            icon: Icons.storefront_outlined,
                            controller: establishmentController,
                            keyboardType: TextInputType.text,
                          ),

                          const SizedBox(height: 24),

                          // ==================================================
                          // Valor
                          // ==================================================
                          TransactionInfoField(
                            labelTitle: '0,00',
                            icon: Icons.attach_money,
                            controller: amountController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // ==================================================
                          // Divisor
                          // ==================================================
                          const Divider(color: Color(0xFF1B3026)),

                          const SizedBox(height: 16),

                          // ==================================================
                          // Descrição
                          // ==================================================
                          TextFormField(
                            controller: descriptionController,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            cursorColor: AppColors.colorsTheme,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(bottom: 40),
                                child: Icon(
                                  Icons.receipt_long_outlined,
                                  color: Color(0xFF00BFA5),
                                ),
                              ),
                              hintText: 'Adicionar descrição',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // ==================================================
                          // Categoria
                          // ==================================================
                          CategorySelector(
                            categories: mockCategories,
                            onSelected: (category) {
                              print(category.id);
                            },
                          ),

                          const SizedBox(height: 16),

                          // ==================================================
                          // Forma de pagamento
                          // ==================================================
                          const Text(
                            'Forma de pagamento',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            children: [
                              Expanded(
                                child: _PaymentOption(
                                  icon: Icons.credit_card,
                                  label: 'Crédito',
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _PaymentOption(
                                  icon: Icons.account_balance_wallet_outlined,
                                  label: 'Débito',
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              Expanded(
                                child: _PaymentOption(
                                  icon: Icons.pix,
                                  label: 'Pix',
                                  onTap: () {},
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _PaymentOption(
                                  icon: Icons.money,
                                  label: 'Dinheiro',
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // ============================================================
                // Botão salvar
                // ============================================================
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: AppElevatedButton(
                      label: 'Salvar',
                      type: ButtonType.filled,
                      backgroundColor: AppColors.colorsTheme,

                      // Aqui vamos usar o controller.
                      // Por enquanto não salvamos nada.
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// =========================
// Opção de pagamento
// =========================

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF0A2B20),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1B3026)),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.colorsTheme, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
