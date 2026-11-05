import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/categorie/controller/category_controller.dart';
import 'package:sem_sufoco/features/home/widgets/app_line.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';
import 'package:sem_sufoco/features/transaction/widget/app_transaction_payment_section.dart';
import 'package:sem_sufoco/features/transaction/widget/category_selector.dart';
import 'package:sem_sufoco/features/transaction/widget/transaction_info_field.dart';
import 'package:sem_sufoco/shared/app_button.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({
    super.key,
    required this.pageController,
    required this.controller,
    required Transaction transaction,
  });

  final PageController pageController;
  final NotchBottomBarController controller;

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  // =========================
  // Controllers de Texto
  // =========================

  final establishmentController = TextEditingController();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  // =========================
  // Selecionar Data
  // =========================

  Future<void> _selectDate() async {
    final transactionController = context.read<TransactionController>();

    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDate: transactionController.selectedDate ?? DateTime.now(),
    );

    if (date != null) {
      transactionController.setDate(date);
    }
  }

  // =========================
  // Selecionar Horário
  // =========================

  Future<void> _selectTime() async {
    final transactionController = context.read<TransactionController>();

    final time = await showTimePicker(
      context: context,
      initialTime: transactionController.selectedTime ?? TimeOfDay.now(),
    );

    if (time != null) {
      transactionController.setTime(time);
    }
  }

  // =========================
  // Salvar Transação
  // =========================

  Future<void> _saveTransaction() async {
    final transactionController = context.read<TransactionController>();

    final error = await transactionController.saveTransaction(
      establishment: establishmentController.text,
      amount: amountController.text,
      description: descriptionController.text,
    );

    if (!mounted) return;

    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: Colors.redAccent),
      );

      return;
    }

    // =========================
    // Limpar Formulário
    // =========================

    _clearTextFields();
    transactionController.clearForm();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transação salva com sucesso!')),
    );

    // =========================
    // Navegar Para Transações
    // =========================

    if (widget.pageController.hasClients) {
      widget.pageController.jumpToPage(1);
    }

    widget.controller.jumpTo(1);
  }

  // =========================
  // Limpar Campos de Texto
  // =========================

  void _clearTextFields() {
    establishmentController.clear();
    amountController.clear();
    descriptionController.clear();
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
    final categoryController = context.watch<CategoryController>();
    final transactionController = context.watch<TransactionController>();

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
                        selectedType:
                            transactionController.selectedTransactionType,
                        onSelected: transactionController.setTransactionType,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _TransactionTypeButton(
                        label: 'Saída',
                        icon: Icons.arrow_upward,
                        type: TransactionType.expense,
                        selectedType:
                            transactionController.selectedTransactionType,
                        onSelected: transactionController.setTransactionType,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // =========================
                // Data e Horário
                // =========================
                Row(
                  children: [
                    Expanded(
                      child: TransactionInfoField(
                        labelTitle: transactionController.selectedDate == null
                            ? 'Data'
                            : '${transactionController.selectedDate!.day.toString().padLeft(2, '0')}/'
                                  '${transactionController.selectedDate!.month.toString().padLeft(2, '0')}/'
                                  '${transactionController.selectedDate!.year}',
                        icon: Icons.calendar_today_outlined,
                        readOnly: true,
                        onTap: _selectDate,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TransactionInfoField(
                        labelTitle: transactionController.selectedTime == null
                            ? 'Horário'
                            : transactionController.selectedTime!.format(
                                context,
                              ),
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
                if (categoryController.isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (categoryController.errorMessage != null)
                  Text(
                    categoryController.errorMessage!,
                    style: const TextStyle(color: Colors.redAccent),
                  )
                else
                  CategorySelector(
                    categories: categoryController.categories,
                    onSelected: transactionController.setCategory,
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
                  selectedPaymentMethod:
                      transactionController.selectedPaymentMethod,
                  onSelected: transactionController.setPaymentMethod,
                ),

                const SizedBox(height: 16),

                // =========================
                // Salvar
                // =========================
                SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    label: transactionController.isSaving
                        ? 'Salvando...'
                        : 'Salvar',
                    onPressed: transactionController.isSaving
                        ? null
                        : _saveTransaction,
                  ),
                ),
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
