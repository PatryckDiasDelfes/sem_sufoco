import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/model/transaction.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/home/widgets/app_line.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';
import 'package:sem_sufoco/features/transaction/widget/app_transaction_payment_section.dart';
import 'package:sem_sufoco/features/transaction/widget/category_selector.dart';
import 'package:sem_sufoco/features/transaction/widget/transaction_info_field.dart';
import 'package:sem_sufoco/shared/app_button.dart';
import 'package:sem_sufoco/shared/mocks/category_mock.dart';

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

  PaymentMethod? selectedPaymentMethod;

  // =========================
  // Categoria selecionada
  // =========================

  Category? selectedCategory;

  // =========================
  // Data e Hora selecionadas
  // =========================

  DateTime? selectedDate;

  TimeOfDay? selectedTime;

  // =========================
  // Selecionar Data
  // =========================

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDate: selectedDate ?? DateTime.now(),
    );

    if (date == null) return;

    setState(() {
      selectedDate = date;
    });
  }

  // =========================
  // Selecionar Hora
  // =========================

  Future<void> _selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (time == null) return;

    setState(() {
      selectedTime = time;
    });
  }

  // =========================
  // Dispose
  // =========================

  @override
  void dispose() {
    establishmentController.dispose();
    amountController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  // =========================
  // Build
  // =========================

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionController>(
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: AppColors.backGround,

          // =========================
          // AppBar
          // =========================
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

          // =========================
          // Conteúdo
          // =========================
          body: SafeArea(
            child: SingleChildScrollView(
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
                          // =========================
                          // Título
                          // =========================
                          Text(
                            'Sobre a transação',
                            style: AppTextStyle.bodySmall.copyWith(
                              color: AppColors.white,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // =========================
                          // Data e Hora
                          // =========================
                          Row(
                            children: [
                              Expanded(
                                child: TransactionInfoField(
                                  labelTitle: selectedDate == null
                                      ? 'Data'
                                      : '${selectedDate!.day.toString().padLeft(2, '0')}/'
                                            '${selectedDate!.month.toString().padLeft(2, '0')}/'
                                            '${selectedDate!.year}',
                                  icon: Icons.calendar_today_outlined,
                                  readOnly: true,
                                  onTap: _selectDate,
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: TransactionInfoField(
                                  labelTitle: selectedTime == null
                                      ? 'Horário'
                                      : selectedTime!.format(context),
                                  icon: Icons.access_time,
                                  readOnly: true,
                                  onTap: _selectTime,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // =========================
                          // Estabelecimento
                          // =========================
                          TransactionInfoField(
                            labelTitle: 'Estabelecimento',
                            icon: Icons.storefront_outlined,
                            controller: establishmentController,
                            keyboardType: TextInputType.text,
                          ),

                          const SizedBox(height: 24),

                          // =========================
                          // Valor
                          // =========================
                          TransactionInfoField(
                            labelTitle: '0,00',
                            icon: Icons.attach_money,
                            controller: amountController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // =========================
                          // Divisor
                          // =========================
                          const AppLine(size: 1),

                          const SizedBox(height: 16),

                          // =========================
                          // Descrição
                          // =========================
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

                          // =========================
                          // Categoria
                          // =========================
                          SizedBox(
                            child: CategorySelector(
                              categories: mockCategories,
                              onSelected: (category) {
                                setState(() {
                                  selectedCategory = category;
                                });
                              },
                            ),
                          ),

                          const SizedBox(height: 10),

                          // =========================
                          // Forma de pagamento
                          // =========================
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
                            selectedPaymentMethod: selectedPaymentMethod,
                            onSelected: (paymentMethod) {
                              setState(() {
                                selectedPaymentMethod = paymentMethod;
                              });
                            },
                          ),

                          const SizedBox(height: 16),

                          // =========================
                          // Salvar
                          // =========================
                          AppButton(
                            label: 'Salvar',
                            onPressed: () {
                              // =========================
                              // Verificar Data e Hora
                              // =========================

                              if (selectedDate == null ||
                                  selectedTime == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Selecione a data e o horário.',
                                    ),
                                  ),
                                );
                                return;
                              }

                              // =========================
                              // Verificar Categoria
                              // =========================

                              if (selectedCategory == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Selecione uma categoria.'),
                                  ),
                                );
                                return;
                              }

                              // =========================
                              // Verificar Pagamento
                              // =========================

                              if (selectedPaymentMethod == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Selecione uma forma de pagamento.',
                                    ),
                                  ),
                                );
                                return;
                              }

                              // =========================
                              // Converter Valor
                              // =========================

                              final amount = double.tryParse(
                                amountController.text.replaceAll(',', '.'),
                              );

                              if (amount == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Informe um valor válido.'),
                                  ),
                                );
                                return;
                              }

                              // =========================
                              // Montar Data e Hora
                              // =========================

                              final purchasedAt = DateTime(
                                selectedDate!.year,
                                selectedDate!.month,
                                selectedDate!.day,
                                selectedTime!.hour,
                                selectedTime!.minute,
                              );

                              // =========================
                              // Adicionar Transação
                              // =========================

                              final error = controller.addTransaction(
                                establishment: establishmentController.text,
                                amount: amount,
                                description: descriptionController.text,
                                categoryId: selectedCategory!.id,
                                purchasedAt: purchasedAt,
                                paymentMethod: selectedPaymentMethod!,
                                type: TransactionType.expense,
                              );

                              // =========================
                              // Verificar Resultado
                              // =========================

                              if (error != null) {
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text(error)));
                                return;
                              }

                              // =========================
                              // Voltar Para Home
                              // =========================

                              context.go('/HomePage');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
