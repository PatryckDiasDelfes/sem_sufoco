import 'package:flutter/foundation.dart' hide Category;

import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/model/transaction.dart';

class ExtractController extends ChangeNotifier {
  List<Transaction> _transactions = [];
  List<Category> _categories = [];

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> Function()? _onRefresh;

  // =========================
  // Atualização dos dados
  // =========================

  void updateData({
    required List<Transaction> transactions,
    required List<Category> categories,
    required bool isLoading,
    required String? errorMessage,
    required Future<void> Function() onRefresh,
  }) {
    _transactions = List.of(transactions);
    _categories = List.of(categories);
    _isLoading = isLoading;
    _errorMessage = errorMessage;
    _onRefresh = onRefresh;

    notifyListeners();
  }

  // =========================
  // Estados
  // =========================

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  bool get isEmpty => _transactions.isEmpty;

  int get transactionCount => _transactions.length;

  // =========================
  // Atualização do extrato
  // =========================

  Future<void> refresh() async {
    if (_onRefresh == null) return;

    await _onRefresh!();
  }

  // =========================
  // Ordenação dos lançamentos
  // =========================

  List<Transaction> get transactions {
    final result = List<Transaction>.of(_transactions);

    result.sort((a, b) => b.purchasedAt.compareTo(a.purchasedAt));

    return result;
  }

  // =========================
  // Último lançamento
  // =========================

  Transaction? get lastTransaction {
    final list = transactions;

    return list.isEmpty ? null : list.first;
  }

  // =========================
  // Demais lançamentos
  // =========================

  List<Transaction> get otherTransactions {
    final list = transactions;

    if (list.length <= 1) {
      return [];
    }

    return list.sublist(1);
  }

  // =========================
  // Cálculo do saldo
  // =========================

  double get balance {
    return _transactions.fold<double>(0, (total, transaction) {
      if (transaction.type == TransactionType.income) {
        return total + transaction.amount;
      }

      return total - transaction.amount;
    });
  }

  // =========================
  // Busca de categoria
  // =========================

  Category? getCategory(String categoryId) {
    for (final category in _categories) {
      if (category.id == categoryId) {
        return category;
      }
    }

    return null;
  }

  // =========================
  // Formatação de valores
  // =========================

  String formatCurrency(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  String formatTime(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }
}
