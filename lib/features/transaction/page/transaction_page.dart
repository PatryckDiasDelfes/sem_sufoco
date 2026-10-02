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
  final TextEditingController establishmentController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    establishmentController.dispose();
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
String _formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransactionController(),
      child: Consumer<TransactionController>(
        builder: (context, controller, child) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              title: const Text('Novo lançamento',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
              centerTitle: true,
              actions: const [
                Icon(Icons.camera_outlined, color: Color(0xFF00BFA5)),
                SizedBox(width: 16),
              ],
            ),
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
                          Text('Sobre a transação',
                              style: AppTextStyle.bodySmall.copyWith(color: AppColors.white)),
                          const SizedBox(height: 24),
                        Row(
  children: [
    Expanded(
      child: TransactionInfoField(
        labelTitle: _formatDate(controller.selectedDate),
        icon: Icons.calendar_today_outlined,
        readOnly: true,
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            
            initialDate: controller.selectedDate,
            firstDate: DateTime(2020),
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            controller.setDate(picked);
          }
        },
      ),
    ),
    const SizedBox(width: 12),
    Expanded(
      child: TransactionInfoField(
        labelTitle: controller.selectedTime.format(context),
        icon: Icons.access_time,
        readOnly: true,
        onTap: () async {
          final picked = await showTimePicker(
            context: context,
            initialTime: controller.selectedTime,
          );
          if (picked != null) {
            controller.setTime(picked);
          }
        },
      ),
    ),
  ],
),
                          const SizedBox(height: 16),
                          TransactionInfoField(
                            labelTitle: 'Estabelecimento',
                            icon: Icons.storefront_outlined,
                            controller: establishmentController,
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 24),
                          TransactionInfoField(
                            labelTitle: '0,00',
                            icon: Icons.attach_money,
                            controller: amountController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          ),
                          const SizedBox(height: 24),
                          const Divider(color: Color(0xFF1B3026)),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: descriptionController,
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                            cursorColor: AppColors.colorsTheme,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(bottom: 40),
                                child: Icon(Icons.receipt_long_outlined, color: Color(0xFF00BFA5)),
                              ),
                              hintText: 'Adicionar descrição',
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                              border: InputBorder.none,
                            ),
                          ),
                          const SizedBox(height: 16),
                          CategorySelector(
                            categories: mockCategories,
                            onSelected: (category) {
                              controller.setCategoria(category.id);
                            },
                          ),
                          const SizedBox(height: 16),
                          const Text('Forma de pagamento',
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _PaymentOption(
                                  icon: Icons.credit_card,
                                  label: 'Crédito',
                                  onTap: () => controller.setPagamento('credito'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _PaymentOption(
                                  icon: Icons.account_balance_wallet_outlined,
                                  label: 'Débito',
                                  onTap: () => controller.setPagamento('debito'),
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
                                  onTap: () => controller.setPagamento('pix'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _PaymentOption(
                                  icon: Icons.money,
                                  label: 'Dinheiro',
                                  onTap: () => controller.setPagamento('dinheiro'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: AppElevatedButton(
                      label: controller.isLoading ? 'Salvando...' : 'Salvar',
                      type: ButtonType.filled,
                      backgroundColor: AppColors.colorsTheme,
                      onPressed: () {
                        controller.salvarTransacao(
                          estabelecimento: establishmentController.text,
                          valor: amountController.text,
                          descricao: descriptionController.text,
                        );
                      },
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

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({required this.icon, required this.label, required this.onTap});
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
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}