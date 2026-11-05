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
      final error = await transactionController.removeTransaction(
        transaction.id,
      );

      return error;
    } finally {
      _isDeleting = false;
      notifyListeners();
    }
  }
}
