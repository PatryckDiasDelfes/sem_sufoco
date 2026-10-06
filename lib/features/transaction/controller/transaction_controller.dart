import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/shared/mocks/transaction_mock.dart';

class TransactionController extends ChangeNotifier {
  // =========================
  // Transações
  // =========================

  final List<Transaction> _transactions = [...mockTransactions];

  List<Transaction> get transactions => List.unmodifiable(_transactions);

  // =========================
  // Adicionar
  // =========================

  String? addTransaction({
    required String establishment,
    required double amount,
    required String description,
    required String categoryId,
    required DateTime purchasedAt,
    required PaymentMethod paymentMethod,
    required TransactionType type,
  }) {
    final validationError = _validateTransaction(
      establishment: establishment,
      amount: amount,
      categoryId: categoryId,
      purchasedAt: purchasedAt,
    );

    if (validationError != null) {
      return validationError;
    }

    final transaction = Transaction(
      id: 'transaction_${DateTime.now().millisecondsSinceEpoch}',
      purchasedAt: purchasedAt,
      establishment: establishment.trim(),
      amount: amount,
      description: description.trim(),
      categoryId: categoryId,
      paymentMethod: paymentMethod,
      type: type,
    );

    _transactions.add(transaction);

    notifyListeners();

    return null;
  }

  // =========================
  // Editar
  // =========================

  String? updateTransaction({
    required String id,
    required String establishment,
    required double amount,
    required String description,
    required String categoryId,
    required DateTime purchasedAt,
    required PaymentMethod paymentMethod,
    required TransactionType type,
  }) {
    final validationError = _validateTransaction(
      establishment: establishment,
      amount: amount,
      categoryId: categoryId,
      purchasedAt: purchasedAt,
    );

    if (validationError != null) {
      return validationError;
    }

    final index = _transactions.indexWhere(
      (transaction) => transaction.id == id,
    );

    if (index == -1) {
      return 'Lançamento não encontrado.';
    }

    _transactions[index] = Transaction(
      id: id,
      purchasedAt: purchasedAt,
      establishment: establishment.trim(),
      amount: amount,
      description: description.trim(),
      categoryId: categoryId,
      paymentMethod: paymentMethod,
      type: type,
    );

    notifyListeners();

    return null;
  }

  // =========================
  // Excluir
  // =========================

  String? removeTransaction(String id) {
    if (id.trim().isEmpty) {
      return 'Lançamento inválido.';
    }

    final index = _transactions.indexWhere(
      (transaction) => transaction.id == id,
    );

    if (index == -1) {
      return 'Lançamento não encontrado.';
    }

    _transactions.removeAt(index);

    notifyListeners();

    return null;
  }

  // =========================
  // Buscar Por ID
  // =========================

  Transaction? getById(String id) {
    try {
      return _transactions.firstWhere((transaction) => transaction.id == id);
    } catch (_) {
      return null;
    }
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
