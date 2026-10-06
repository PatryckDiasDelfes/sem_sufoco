import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppMoneyTitle extends StatelessWidget {
  const AppMoneyTitle({super.key, required this.totalAmount});

  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Text(
      totalAmount < 0
          ? '- ${_formatMoney(totalAmount.abs())}'
          : '+ ${_formatMoney(totalAmount)}',
      style: TextStyle(
        color: totalAmount < 0 ? AppColors.red : AppColors.grenLive,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  String _formatMoney(double value) {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }
}
