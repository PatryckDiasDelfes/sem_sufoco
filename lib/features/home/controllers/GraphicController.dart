import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:sem_sufoco/core/model/transaction.dart';

class GraphicGroup {
  final int x;
  final double income;
  final double expense;
  final double balance;

  const GraphicGroup({
    required this.x,
    required this.income,
    required this.expense,
    required this.balance,
  });

  List<double> get values => [income, expense, balance];
}

class GraphicController extends ChangeNotifier {
  GraphicController({required List<Transaction> transactions})
    : _transactions = transactions {
    _selectedMonth = _initialMonth();
  }

  static const int daysPerGroup = 5;
  static const int groupsCount = 7;

  List<Transaction> _transactions;
  late DateTime _selectedMonth;

  DateTime get selectedMonth => _selectedMonth;

  // =========================
  // Atualizar Transações
  // =========================

  void updateTransactions(List<Transaction> transactions) {
    _transactions = transactions;

    if (!_transactions.any(
      (transaction) =>
          transaction.purchasedAt.year == _selectedMonth.year &&
          transaction.purchasedAt.month == _selectedMonth.month,
    )) {
      _selectedMonth = _initialMonth();
    }

    notifyListeners();
  }

  // =========================
  // Mês Inicial
  // =========================

  DateTime _initialMonth() {
    if (_transactions.isEmpty) {
      final now = DateTime.now();
      return DateTime(now.year, now.month);
    }

    final last = _transactions
        .map((t) => t.purchasedAt)
        .reduce((a, b) => a.isAfter(b) ? a : b);

    return DateTime(last.year, last.month);
  }

  void selectMonth(DateTime month) {
    _selectedMonth = DateTime(month.year, month.month);
    notifyListeners();
  }

  // =========================
  // Transações Do Mês
  // =========================

  List<Transaction> get _monthTransactions => _transactions
      .where(
        (t) =>
            t.purchasedAt.year == _selectedMonth.year &&
            t.purchasedAt.month == _selectedMonth.month,
      )
      .toList();

  // =========================
  // Grupos Do Gráfico
  // =========================

  List<GraphicGroup> get groups {
    final income = List<double>.filled(groupsCount, 0);
    final expense = List<double>.filled(groupsCount, 0);

    for (final t in _monthTransactions) {
      final index = ((t.purchasedAt.day - 1) ~/ daysPerGroup)
          .clamp(0, groupsCount - 1)
          .toInt();

      if (t.type == TransactionType.income) {
        income[index] += t.amount;
      } else {
        expense[index] += t.amount;
      }
    }

    return List.generate(groupsCount, (i) {
      final balance = (income[i] - expense[i]).clamp(0, double.infinity);

      return GraphicGroup(
        x: i * daysPerGroup,
        income: income[i],
        expense: expense[i],
        balance: balance.toDouble(),
      );
    });
  }

  // =========================
  // Maior Valor
  // =========================

  double get _maxValue {
    double max = 0;

    for (final g in groups) {
      for (final v in g.values) {
        if (v > max) max = v;
      }
    }

    return max;
  }

  // =========================
  // Intervalo Do Gráfico
  // =========================

  double get interval {
    final max = _maxValue;

    if (max <= 0) return 100;

    final raw = max / 4;
    final magnitude = pow(10, (log(raw) / ln10).floor()).toDouble();

    final residual = raw / magnitude;

    final double nice;

    if (residual <= 1) {
      nice = 1;
    } else if (residual <= 2) {
      nice = 2;
    } else if (residual <= 5) {
      nice = 5;
    } else {
      nice = 10;
    }

    return nice * magnitude;
  }

  // =========================
  // Teto Do Gráfico
  // =========================

  double get maxY {
    final max = _maxValue;

    if (max <= 0) return interval;

    return (max / interval).ceil() * interval;
  }

  // =========================
  // Meses
  // =========================

  static const List<String> _monthNames = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
  ];

  String get monthName => _monthNames[_selectedMonth.month - 1];

  String monthLabel(DateTime month) =>
      '${_monthNames[month.month - 1]} ${month.year}';

  // =========================
  // Meses Disponíveis
  // =========================

  List<DateTime> get availableMonths {
    if (_transactions.isEmpty) return [_selectedMonth];

    final dates = _transactions.map((t) => t.purchasedAt);

    final first = dates.reduce((a, b) => a.isBefore(b) ? a : b);
    final last = dates.reduce((a, b) => a.isAfter(b) ? a : b);

    final months = <DateTime>[];

    var cursor = DateTime(first.year, first.month);
    final end = DateTime(last.year, last.month);

    while (!cursor.isAfter(end)) {
      months.add(cursor);
      cursor = DateTime(cursor.year, cursor.month + 1);
    }

    return months;
  }

  // =========================
  // Saldo Anterior
  // =========================

  double _balanceBefore(DateTime limit) {
    double total = 0;

    for (final t in _transactions) {
      if (!t.purchasedAt.isBefore(limit)) continue;

      total += t.type == TransactionType.income ? t.amount : -t.amount;
    }

    return total;
  }

  // =========================
  // Saldo Atual
  // =========================

  double get currentBalance =>
      _balanceBefore(DateTime(_selectedMonth.year, _selectedMonth.month + 1));

  // =========================
  // Saldo Anterior
  // =========================

  double get _previousBalance =>
      _balanceBefore(DateTime(_selectedMonth.year, _selectedMonth.month));

  // =========================
  // Variação
  // =========================

  double? get percentChange {
    final previous = _previousBalance;

    if (previous == 0) return null;

    return (currentBalance - previous) / previous.abs() * 100;
  }

  bool get isGrowing => (percentChange ?? 0) >= 0;

  String get percentText {
    if (!_showBalance) return '•••';

    final p = percentChange;

    if (p == null) return '--';

    return '${p >= 0 ? '+' : ''}${p.toStringAsFixed(0)}%';
  }

  // =========================
  // Texto Do Saldo
  // =========================

  String get balanceText =>
      _showBalance ? _formatCurrency(currentBalance) : 'R\$ ••••••';

  String _formatCurrency(double value) {
    final negative = value < 0;

    final parts = value.abs().toStringAsFixed(2).split('.');

    final integer = parts[0].replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => '.',
    );

    return '${negative ? '-' : ''}R\$ $integer,${parts[1]}';
  }

  // =========================
  // Exibir Saldo
  // =========================

  bool _showBalance = true;

  bool get showBalance => _showBalance;

  void toggleBalance() {
    _showBalance = !_showBalance;
    notifyListeners();
  }
}
