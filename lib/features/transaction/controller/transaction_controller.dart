import 'package:flutter/material.dart';

import '../../../core/model/transaction.dart';

class TransactionController extends ChangeNotifier {
  // =========================
  // Lista de transações
  // =========================

  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  // =========================
  // Adicionar transação
  // =========================

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);

    notifyListeners();
  }

  // =========================
  // Remover transação
  // =========================

  void removeTransaction(String id) {
    _transactions.removeWhere((transaction) => transaction.id == id);

    notifyListeners();
  }

  // =========================
  // Buscar transação
  // =========================

  Transaction? getTransactionById(String id) {
    try {
      return _transactions.firstWhere((transaction) => transaction.id == id);
    } catch (_) {
      return null;
    }
  }
}
