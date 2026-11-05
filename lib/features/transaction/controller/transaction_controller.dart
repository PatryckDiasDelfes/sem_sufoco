import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/features/transaction/service/transaction_service.dart';

class TransactionController extends ChangeNotifier {
  // =========================
  // Serviço
  // =========================

  final TransactionService _service = TransactionService();

  // =========================
  // Transações
  // =========================

  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => List.unmodifiable(_transactions);

  bool _isLoading = false;
  bool _isSaving = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String? get errorMessage => _errorMessage;

  // =========================
  // Estado do Formulário
  // =========================

  Category? _selectedCategory;
  PaymentMethod? _selectedPaymentMethod;
  TransactionType _selectedTransactionType = TransactionType.expense;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Category? get selectedCategory => _selectedCategory;

  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod;

  TransactionType get selectedTransactionType => _selectedTransactionType;

  DateTime? get selectedDate => _selectedDate;

  TimeOfDay? get selectedTime => _selectedTime;

  // =========================
  // Carregar Transações
  // =========================

  Future<void> loadTransactions() async {
    if (_isLoading) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final transactions = await _service.getTransactions();

      _transactions
        ..clear()
        ..addAll(transactions);
    } catch (error) {
      _errorMessage = 'Não foi possível carregar as transações.';
      debugPrint('Erro ao carregar transações: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // =========================
  // Preparar Edição
  // =========================

  void setTransactionForEditing({
    required Transaction transaction,
    required Category category,
  }) {
    _selectedCategory = category;
    _selectedPaymentMethod = transaction.paymentMethod;
    _selectedTransactionType = transaction.type;
    _selectedDate = transaction.purchasedAt;

    _selectedTime = TimeOfDay(
      hour: transaction.purchasedAt.hour,
      minute: transaction.purchasedAt.minute,
    );

    notifyListeners();
  }

  // =========================
  // Atualizar Categoria
  // =========================

  void setCategory(Category? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // =========================
  // Atualizar Pagamento
  // =========================

  void setPaymentMethod(PaymentMethod? paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }

  // =========================
  // Atualizar Tipo
  // =========================

  void setTransactionType(TransactionType type) {
    _selectedTransactionType = type;
    notifyListeners();
  }

  // =========================
  // Atualizar Data
  // =========================

  void setDate(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }

  // =========================
  // Atualizar Horário
  // =========================

  void setTime(TimeOfDay? time) {
    _selectedTime = time;
    notifyListeners();
  }

  // =========================
  // Limpar Formulário
  // =========================

  void clearForm() {
    _selectedCategory = null;
    _selectedPaymentMethod = null;
    _selectedTransactionType = TransactionType.expense;
    _selectedDate = null;
    _selectedTime = null;

    notifyListeners();
  }

  // =========================
  // Adicionar Transação
  // =========================

  Future<String?> addTransaction({
    required String establishment,
    required double amount,
    required String description,
    required String categoryId,
    required DateTime purchasedAt,
    required PaymentMethod paymentMethod,
    required TransactionType type,
  }) async {
    final validationError = _validateTransaction(
      establishment: establishment,
      amount: amount,
      categoryId: categoryId,
      purchasedAt: purchasedAt,
    );

    if (validationError != null) {
      return validationError;
    }

    if (_isSaving) {
      return 'Aguarde o salvamento da transação.';
    }

    _isSaving = true;
    notifyListeners();

    try {
      final transaction = await _service.addTransaction(
        establishment: establishment,
        amount: amount,
        description: description,
        categoryId: categoryId,
        purchasedAt: purchasedAt,
        paymentMethod: paymentMethod,
        type: type,
      );

      _transactions.insert(0, transaction);

      return null;
    } catch (error, stackTrace) {
      debugPrint('Erro ao adicionar transação: $error');
      debugPrint('StackTrace: $stackTrace');

      return 'Erro ao salvar: $error';
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  // =========================
  // Salvar Transação
  // =========================

  Future<String?> saveTransaction({
    required String establishment,
    required String amount,
    required String description,
  }) async {
    if (_selectedDate == null || _selectedTime == null) {
      return 'Selecione a data e o horário.';
    }

    if (_selectedCategory == null) {
      return 'Selecione uma categoria.';
    }

    if (_selectedPaymentMethod == null) {
      return 'Selecione uma forma de pagamento.';
    }

    final parsedAmount = double.tryParse(amount.replaceAll(',', '.'));

    if (parsedAmount == null) {
      return 'Informe um valor válido.';
    }

    final purchasedAt = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    return await addTransaction(
      establishment: establishment,
      amount: parsedAmount,
      description: description,
      categoryId: _selectedCategory!.id,
      purchasedAt: purchasedAt,
      paymentMethod: _selectedPaymentMethod!,
      type: _selectedTransactionType,
    );
  }

  // =========================
  // Editar Transação
  // =========================

  Future<String?> updateTransaction({
    required String id,
    required String establishment,
    required double amount,
    required String description,
    required String categoryId,
    required DateTime purchasedAt,
    required PaymentMethod paymentMethod,
    required TransactionType type,
  }) async {
    final validationError = _validateTransaction(
      establishment: establishment,
      amount: amount,
      categoryId: categoryId,
      purchasedAt: purchasedAt,
    );

    if (validationError != null) {
      return validationError;
    }

    if (_isSaving) {
      return 'Aguarde a operação em andamento.';
    }

    final index = _transactions.indexWhere(
      (transaction) => transaction.id == id,
    );

    if (index == -1) {
      return 'Lançamento não encontrado.';
    }

    _isSaving = true;
    notifyListeners();

    try {
      final updatedTransaction = await _service.updateTransaction(
        id: id,
        establishment: establishment,
        amount: amount,
        description: description,
        categoryId: categoryId,
        purchasedAt: purchasedAt,
        paymentMethod: paymentMethod,
        type: type,
      );

      _transactions[index] = updatedTransaction;

      return null;
    } catch (error, stackTrace) {
      debugPrint('Erro ao atualizar transação: $error');
      debugPrint('StackTrace: $stackTrace');

      return 'Não foi possível atualizar a transação.';
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  // =========================
  // Excluir Transação
  // =========================

  Future<String?> removeTransaction(String id) async {
    if (id.trim().isEmpty) {
      return 'Lançamento inválido.';
    }

    if (_isSaving) {
      return 'Aguarde a operação em andamento.';
    }

    final index = _transactions.indexWhere(
      (transaction) => transaction.id == id,
    );

    if (index == -1) {
      return 'Lançamento não encontrado.';
    }

    _isSaving = true;
    notifyListeners();

    try {
      await _service.removeTransaction(id);

      _transactions.removeAt(index);

      return null;
    } catch (error, stackTrace) {
      debugPrint('Erro ao excluir transação: $error');
      debugPrint('StackTrace: $stackTrace');

      return 'Não foi possível excluir a transação.';
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  // =========================
  // Buscar Por ID
  // =========================

  Transaction? getById(String id) {
    for (final transaction in _transactions) {
      if (transaction.id == id) {
        return transaction;
      }
    }

    return null;
  }

  // =========================
  // Validar Transação
  // =========================

  String? _validateTransaction({
    required String establishment,
    required double amount,
    required String categoryId,
    required DateTime purchasedAt,
  }) {
    if (establishment.trim().isEmpty) {
      return 'Informe o estabelecimento.';
    }

    if (amount <= 0) {
      return 'O valor deve ser maior que zero.';
    }

    if (categoryId.trim().isEmpty) {
      return 'Selecione uma categoria.';
    }

    if (purchasedAt.isAfter(DateTime.now())) {
      return 'A data do lançamento não pode ser futura.';
    }

    return null;
  }
}
