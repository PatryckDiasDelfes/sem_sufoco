import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/home/widgets/app_line.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';
import 'package:sem_sufoco/features/transaction/widget/app_transaction_payment_section.dart';
import 'package:sem_sufoco/features/transaction/widget/category_selector.dart';
import 'package:sem_sufoco/features/transaction/widget/transaction_info_field.dart';
import 'package:sem_sufoco/shared/mocks/category_mock.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  Future<void> _selectDate(TransactionController controller) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );
    controller.setDate(date);
  }

  Future<void> _selectTime(TransactionController controller) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    controller.setTime(time);
  }

  void _save(TransactionController controller) {
    final error = controller.submit();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error ?? 'Gasto salvo com sucesso!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionController>(
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: AppColors.backGround,

          // ============================================================
          // AppBar
          // ============================================================
          appBar: AppBar(
            backgroundColor: AppColors.backGround,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: const Text(
              'Novo lançamento',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            centerTitle: true,
            actions: const [
              Icon(Icons.camera_outlined, color: AppColors.accent),
              SizedBox(width: 16),
            ],
          ),

          // ============================================================
          // Botão salvar
          // ============================================================
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => _save(controller),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ============================================================
          // Conteúdo (rolável)
          // ============================================================
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(bottom: 200),
            child: Column(
              children: [
                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.cardGreen),
                      boxShadow: const [
                        BoxShadow(color: AppColors.shodownBox, blurRadius: 4),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sobre a transação',
                          style: AppTextStyle.bodySmall.copyWith(
                            color: AppColors.white,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Data e horário
                        Row(
                          children: [
                            Expanded(
                              child: TransactionInfoField(
                                labelTitle: 'Data',
                                icon: Icons.calendar_today_outlined,
                                controller: controller.dateController,
                                readOnly: true,
                                onTap: () => _selectDate(controller),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TransactionInfoField(
                                labelTitle: 'Horário',
                                icon: Icons.access_time,
                                controller: controller.timeController,
                                readOnly: true,
                                onTap: () => _selectTime(controller),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Estabelecimento
                        TransactionInfoField(
                          labelTitle: 'Estabelecimento',
                          icon: Icons.storefront_outlined,
                          controller: controller.establishmentController,
                          keyboardType: TextInputType.text,
                        ),

                        const SizedBox(height: 24),

                        // Valor (somente números, vírgula ou ponto, 2 casas)
                        TransactionInfoField(
                          labelTitle: '0,00',
                          icon: Icons.attach_money,
                          controller: controller.amountController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*[,.]?\d{0,2}'),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        const AppLine(size: 1),

                        const SizedBox(height: 16),

                        // Descrição
                        TextFormField(
                          controller: controller.descriptionController,
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
                                color: AppColors.accent,
                              ),
                            ),
                            hintText: 'Adicionar descrição',
                            hintStyle: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Categoria
                        CategorySelector(
                          categories: mockCategories,
                          selectedCategoryId: controller.selectedCategoryId,
                          onSelected: (category) =>
                              controller.selectCategory(category.id),
                        ),

                        const SizedBox(height: 10),

                        // Forma de pagamento
                        const Text(
                          'Forma de pagamento',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),

                        AppTransactionPaymentSection(
                          selected: controller.selectedPaymentMethod,
                          onSelected: controller.selectPaymentMethod,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
