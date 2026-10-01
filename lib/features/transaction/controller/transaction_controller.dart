import 'package:flutter/material.dart';
import '../../../core/model/transaction.dart';

class TransactionController extends ChangeNotifier {
  // =========================
  // Lista de transações
  // =========================

  final List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  // =========================
  // Campos da tela de novo lançamento
  // =========================

  String categoriaId = '';
  String formaPagamento = 'credito';
  bool isLoading = false;

  void setCategoria(String id) {
    categoriaId = id;
    notifyListeners();
  }

  void setPagamento(String forma) {
    formaPagamento = forma;
    notifyListeners();
  }

  PaymentMethod _converterPagamento(String forma) {
    switch (forma) {
      case 'debito':
        return PaymentMethod.debitCard;
      case 'pix':
        return PaymentMethod.pix;
      case 'dinheiro':
        return PaymentMethod.cash;
      default:
        return PaymentMethod.creditCard;
    }
  }
// =========================
  // Salvar nova transação
  // =========================
  Future<void> salvarTransacao({
    required String estabelecimento,
    required String valor,
    required String descricao,
  }) async {
    if (estabelecimento.isEmpty || valor.isEmpty) return;

    isLoading = true;
    notifyListeners();

    final valorLimpo = valor.replaceAll('R\$', '').replaceAll('.', '').replaceAll(',', '.').trim();
    final valorDouble = double.tryParse(valorLimpo) ?? 0.0;

    final novaTransacao = Transaction(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      purchasedAt: DateTime.now(),
      establishment: estabelecimento,
      amount: valorDouble,
      description: descricao,
      categoryId: categoriaId,
      paymentMethod: _converterPagamento(formaPagamento),
    );

    _transactions.add(novaTransacao);
    await Future.delayed(const Duration(milliseconds: 500));

    isLoading = false;
    notifyListeners();
  }

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