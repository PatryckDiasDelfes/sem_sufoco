import 'package:flutter/material.dart';

import '../../../core/model/transaction.dart';
import '../../../shared/mocks/transaction_mock.dart';

class TransactionController extends ChangeNotifier {
  // =========================
  // Lista de transações
  // =========================

  final List<Transaction> _transactions = [...mockTransactions];

  List<Transaction> get transactions => List.unmodifiable(_transactions);

  // =========================
  // Campos do formulário
  // =========================

  final TextEditingController establishmentController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedCategoryId;
  PaymentMethod? _selectedPaymentMethod;

  String? get selectedCategoryId => _selectedCategoryId;
  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod;

  // =========================
  // Seleções
  // =========================

  void setDate(DateTime? date) {
    if (date == null) return;
    _selectedDate = date;
    dateController.text = '${_two(date.day)}/${_two(date.month)}/${date.year}';
    notifyListeners();
  }

  void setTime(TimeOfDay? time) {
    if (time == null) return;
    _selectedTime = time;
    timeController.text = '${_two(time.hour)}:${_two(time.minute)}';
    notifyListeners();
  }

  void selectCategory(String categoryId) {
    _selectedCategoryId = categoryId;
    notifyListeners();
  }

  void selectPaymentMethod(PaymentMethod method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }

  // =========================
  // Salvar gasto
  // Retorna null se salvou, ou a mensagem de erro
  // =========================

  String? submit() {
    final establishment = establishmentController.text.trim();
    final amount = _parseAmount(amountController.text);

    if (establishment.isEmpty) return 'Informe o estabelecimento';
    if (amount == null || amount <= 0) return 'Informe um valor válido';
    if (_selectedCategoryId == null) return 'Selecione uma categoria';
    if (_selectedPaymentMethod == null) {
      return 'Selecione a forma de pagamento';
    }

    final now = DateTime.now();
    final date = _selectedDate ?? now;
    final time = _selectedTime ?? TimeOfDay.fromDateTime(now);

    addTransaction(
      Transaction(
        id: now.microsecondsSinceEpoch.toString(),
        purchasedAt: DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        ),
        establishment: establishment,
        amount: amount,
        description: descriptionController.text.trim(),
        categoryId: _selectedCategoryId!,
        paymentMethod: _selectedPaymentMethod!,
        type: TransactionType.expense,
      ),
    );

    clearForm();
    return null;
  }

  void clearForm() {
    establishmentController.clear();
    amountController.clear();
    descriptionController.clear();
    dateController.clear();
    timeController.clear();
    _selectedDate = null;
    _selectedTime = null;
    _selectedCategoryId = null;
    _selectedPaymentMethod = null;
    notifyListeners();
  }

  // =========================
  // Adicionar / remover / buscar
  // =========================

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void removeTransaction(String id) {
    _transactions.removeWhere((transaction) => transaction.id == id);
    notifyListeners();
  }

  Transaction? getTransactionById(String id) {
    for (final transaction in _transactions) {
      if (transaction.id == id) return transaction;
    }
    return null;
  }

  // =========================
  // Helpers
  // =========================

  // Aceita "12,50", "12.50" e "1.234,56"
  double? _parseAmount(String text) {
    var value = text.trim();
    if (value.contains(',')) {
      value = value.replaceAll('.', '').replaceAll(',', '.');
    }
    return double.tryParse(value);
  }

  String _two(int n) => n.toString().padLeft(2, '0');

  @override
  void dispose() {
    establishmentController.dispose();
    amountController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }
}
