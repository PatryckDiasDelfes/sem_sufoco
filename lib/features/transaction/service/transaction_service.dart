import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:sem_sufoco/core/model/transaction.dart';

class TransactionService {
  // =========================
  // Supabase
  // =========================

  final SupabaseClient _supabase = Supabase.instance.client;

  // =========================
  // Usuário Autenticado
  // =========================

  String get _userId {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      throw Exception('Usuário não autenticado.');
    }

    return user.id;
  }

  // =========================
  // Converter Dados do Supabase
  // =========================

  Transaction _fromMap(Map<String, dynamic> data) {
    return Transaction(
      id: data['id'].toString(),
      purchasedAt: DateTime.parse(data['purchased_at'].toString()),
      establishment: data['establishment'].toString(),
      amount: (data['amount'] as num).toDouble(),
      description: data['description']?.toString() ?? '',
      categoryId: data['category_id'].toString(),
      paymentMethod: PaymentMethod.values.firstWhere(
        (method) => method.name == data['payment_method'],
      ),
      type: TransactionType.values.firstWhere(
        (type) => type.name == data['type'],
      ),
    );
  }

  // =========================
  // Converter Dados Para o Supabase
  // =========================

  Map<String, dynamic> _toMap({
    required String establishment,
    required double amount,
    required String description,
    required String categoryId,
    required DateTime purchasedAt,
    required PaymentMethod paymentMethod,
    required TransactionType type,
  }) {
    return {
      'user_id': _userId,
      'establishment': establishment.trim(),
      'amount': amount,
      'description': description.trim(),
      'category_id': categoryId,
      'purchased_at': purchasedAt.toIso8601String(),
      'payment_method': paymentMethod.name,
      'type': type.name,
    };
  }

  // =========================
  // Buscar Transações
  // =========================

  Future<List<Transaction>> getTransactions() async {
    final response = await _supabase
        .from('transactions')
        .select()
        .eq('user_id', _userId)
        .order('purchased_at', ascending: false);

    return response.map<Transaction>((data) {
      return _fromMap(data);
    }).toList();
  }

  // =========================
  // Adicionar Transação
  // =========================

  Future<Transaction> addTransaction({
    required String establishment,
    required double amount,
    required String description,
    required String categoryId,
    required DateTime purchasedAt,
    required PaymentMethod paymentMethod,
    required TransactionType type,
  }) async {
    final response = await _supabase
        .from('transactions')
        .insert(
          _toMap(
            establishment: establishment,
            amount: amount,
            description: description,
            categoryId: categoryId,
            purchasedAt: purchasedAt,
            paymentMethod: paymentMethod,
            type: type,
          ),
        )
        .select()
        .single();

    return _fromMap(response);
  }

  // =========================
  // Atualizar Transação
  // =========================

  Future<Transaction> updateTransaction({
    required String id,
    required String establishment,
    required double amount,
    required String description,
    required String categoryId,
    required DateTime purchasedAt,
    required PaymentMethod paymentMethod,
    required TransactionType type,
  }) async {
    final response = await _supabase
        .from('transactions')
        .update(
          _toMap(
            establishment: establishment,
            amount: amount,
            description: description,
            categoryId: categoryId,
            purchasedAt: purchasedAt,
            paymentMethod: paymentMethod,
            type: type,
          ),
        )
        .eq('id', id)
        .eq('user_id', _userId)
        .select()
        .single();

    return _fromMap(response);
  }

  // =========================
  // Excluir Transação
  // =========================

  Future<void> removeTransaction(String id) async {
    await _supabase
        .from('transactions')
        .delete()
        .eq('id', id)
        .eq('user_id', _userId);
  }
}
