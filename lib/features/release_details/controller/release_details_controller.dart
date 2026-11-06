import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';

class ReleaseDetailsController extends ChangeNotifier {
  // =========================
  // Estado
  // =========================

  bool _isDeleting = false;

  bool get isDeleting => _isDeleting;

  // =========================
  // Buscar Transação Atualizada
  // =========================

  Transaction getCurrentTransaction({
    required Transaction transaction,
    required TransactionController transactionController,
  }) {
    return transactionController.getById(transaction.id) ?? transaction;
  }

  // =========================
  // Excluir Lançamento
  // =========================

  Future<String?> deleteTransaction({
    required Transaction transaction,
    required TransactionController transactionController,
  }) async {
    if (_isDeleting) {
      return 'Aguarde a exclusão do lançamento.';
    }

    _isDeleting = true;
    notifyListeners();

    try {
      return await transactionController.removeTransaction(transaction.id);
    } finally {
      _isDeleting = false;
      notifyListeners();
    }
  }
}
