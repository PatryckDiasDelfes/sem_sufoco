import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/categorie/controller/category_controller.dart';
import 'package:sem_sufoco/features/home/widgets/app_line.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';
import 'package:sem_sufoco/features/transaction/widget/app_transaction_payment_section.dart';
import 'package:sem_sufoco/features/transaction/widget/category_selector.dart';
import 'package:sem_sufoco/features/transaction/widget/transaction_type_selector.dart';
import 'package:sem_sufoco/features/transaction/widget/transaction_date_section.dart';
import 'package:sem_sufoco/features/transaction/widget/transaction_description_field.dart';
import 'package:sem_sufoco/features/transaction/widget/transaction_info_field.dart';
import 'package:sem_sufoco/shared/app_button.dart';

// =========================
// Transaction Page
// =========================

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

    _clearTextFields();
    transactionController.clearForm();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transação salva com sucesso!')),
    );

    // =========================
    // Navegação
    // =========================

    if (widget.pageController.hasClients) {
      widget.pageController.jumpToPage(1);
    }

    widget.controller.jumpTo(1);
  }

  // =========================
  // Limpar Campos
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
  // Interface
  // =========================

  @override
  Widget build(BuildContext context) {
    final categoryController = context.watch<CategoryController>();
    final transactionController = context.watch<TransactionController>();

    return Scaffold(
      backgroundColor: AppColors.backGround,
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
                Text(
                  'Sobre a transação',
                  style: AppTextStyle.bodySmall.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 16),

                TransactionTypeSelector(
                  selectedType: transactionController.selectedTransactionType,
                  onSelected: transactionController.setTransactionType,
                ),

                const SizedBox(height: 24),

                TransactionDateSection(
                  selectedDate: transactionController.selectedDate,
                  selectedTime: transactionController.selectedTime,
                  onSelectDate: _selectDate,
                  onSelectTime: _selectTime,
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
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),

                const SizedBox(height: 24),

                const AppLine(size: 1),
                const SizedBox(height: 16),

                TransactionDescriptionField(controller: descriptionController),

                const SizedBox(height: 16),

                if (categoryController.isLoading &&
                    categoryController.categories.isEmpty)
                  const Center(child: CircularProgressIndicator())
                else if (categoryController.errorMessage != null &&
                    categoryController.categories.isEmpty)
                  Text(
                    categoryController.errorMessage!,
                    style: const TextStyle(color: Colors.redAccent),
                  )
                else
                  CategorySelector(
                    categories: categoryController.categories,
                    selectedCategoryId:
                        transactionController.selectedCategory?.id,
                    onSelected: transactionController.setCategory,
                  ),

                const SizedBox(height: 10),

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
