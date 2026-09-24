import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/models/transaction.dart';
import 'package:sem_sufoco/shared/widget/elevated_botton.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();

  TransactionType _type = TransactionType.expense;
  DateTime _date = DateTime.now();
  int _amountInCents = 0;
  String? _category;

  String get _title => _type == TransactionType.expense
      ? 'Adicionar Gasto'
      : 'Adicionar Receita';

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final transaction = Transaction(
        id: UniqueKey().toString(),
        description: _descriptionController.text,
        amountInCents: _amountInCents,
        date: _date,
        type: _type,
        category: _category ?? '',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: const [],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: AppElevatedButton(
                    label: _title,
                    type: ButtonType.filled,
                    backgroundColor: AppColors.accent,
                    onPressed: _submit,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      child: Row(
        children: [
          IconButton.filled(
            onPressed: () => context.pop(),
            style: IconButton.styleFrom(backgroundColor: AppColors.darkSurface),
            icon: const Icon(Icons.chevron_left, color: AppColors.white),
          ),
          Expanded(
            child: Text(
              _title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
