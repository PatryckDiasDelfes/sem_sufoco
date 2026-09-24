enum TransactionType { income, expense }

class Transaction {
  final String id;
  final String description;
  final int amountInCents;
  final TransactionType type;
  final String category;
  final DateTime date;

  const Transaction({
    required this.id,
    required this.description,
    required this.amountInCents,
    required this.date,
    required this.type,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'amountInCents': amountInCents,
      'type': type.name,
      'category': category,
      'date': date.toIso8601String(),
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      description: map['description'],
      amountInCents: map['amountInCents'],
      type: TransactionType.values.byName(map['type']),
      category: map['category'],
      date: DateTime.parse(map['date']),
    );
  }
}
