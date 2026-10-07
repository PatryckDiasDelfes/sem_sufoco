import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
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
  const TransactionPage({
    super.key,
    required this.pageController,
    required this.controller,
  });

  final PageController pageController;
  final NotchBottomBarController controller;

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  // =========================
  // Controllers
  // =========================

  final establishmentController = TextEditingController();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  // =========================
  // Seleções
  // =========================

  Category? selectedCategory;
  PaymentMethod? selectedPaymentMethod;
  TransactionType selectedTransactionType = TransactionType.expense;
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

    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  // =========================
  // Selecionar Hora
  // =========================

  Future<void> _selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (time != null) {
      setState(() => selectedTime = time);
    }
  }

  // =========================
  // Salvar
  // =========================

  void _saveTransaction() {
    final controller = context.read<TransactionController>();

    final error = controller.saveTransaction(
      establishment: establishmentController.text,
      amount: amountController.text,
      description: descriptionController.text,
      categoryId: selectedCategory?.id ?? '',
      date: selectedDate,
      time: selectedTime,
      paymentMethod: selectedPaymentMethod,
      type: selectedTransactionType,
    );

    if (error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
      return;
    }

    _clearForm();

    if (widget.pageController.hasClients) {
      widget.pageController.jumpToPage(1);
    }

    widget.controller.jumpTo(1);
  }

  // =========================
  // Limpar Formulário
  // =========================

  void _clearForm() {
    establishmentController.clear();
    amountController.clear();
    descriptionController.clear();

    setState(() {
      selectedCategory = null;
      selectedPaymentMethod = null;
      selectedTransactionType = TransactionType.expense;
      selectedDate = null;
      selectedTime = null;
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
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
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

                const SizedBox(height: 16),

                // =========================
                // Tipo da Transação
                // =========================
                Row(
                  children: [
                    Expanded(
                      child: _TransactionTypeButton(
                        label: 'Entrada',
                        icon: Icons.arrow_downward,
                        type: TransactionType.income,
                        selectedType: selectedTransactionType,
                        onSelected: (type) {
                          setState(() {
                            selectedTransactionType = type;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _TransactionTypeButton(
                        label: 'Saída',
                        icon: Icons.arrow_upward,
                        type: TransactionType.expense,
                        selectedType: selectedTransactionType,
                        onSelected: (type) {
                          setState(() {
                            selectedTransactionType = type;
                          });
                        },
                      ),
                    ),
                  ],
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

                const AppLine(size: 1),

                const SizedBox(height: 16),

                // =========================
                // Descrição
                // =========================
                TextFormField(
                  controller: descriptionController,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
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
                    hintStyle: TextStyle(color: AppColors.white, fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),

                const SizedBox(height: 16),

                // =========================
                // Categoria
                // =========================
                CategorySelector(
                  categories: mockCategories,
                  onSelected: (category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ),

                const SizedBox(height: 10),

                // =========================
                // Forma de Pagamento
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
                AppButton(label: 'Salvar', onPressed: _saveTransaction),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =========================
// Botão de Tipo
// =========================

class _TransactionTypeButton extends StatelessWidget {
  const _TransactionTypeButton({
    required this.label,
    required this.icon,
    required this.type,
    required this.selectedType,
    required this.onSelected,
  });

  final String label;
  final IconData icon;
  final TransactionType type;
  final TransactionType selectedType;
  final ValueChanged<TransactionType> onSelected;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedType == type;

    return GestureDetector(
      onTap: () => onSelected(type),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.cardGreen : AppColors.bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.accent : AppColors.cardGreen,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: AppColors.accent),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
