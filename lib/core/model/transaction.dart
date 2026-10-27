// =========================
// Tipo de transação
// =========================

enum TransactionType { income, expense }

// =========================
// Forma de pagamento
// =========================

enum PaymentMethod { creditCard, debitCard, pix, cash }

// =========================
// Model de transação
// =========================

class Transaction {
  final String id;
  final DateTime purchasedAt;
  final String establishment;
  final double amount;
  final String description;
  final String categoryId;
  final PaymentMethod paymentMethod;
  final TransactionType type;

  const Transaction({
    required this.id,
    required this.purchasedAt,
    required this.establishment,
    required this.amount,
    required this.description,
    required this.categoryId,
    required this.paymentMethod,
    required this.type,
  });
}
