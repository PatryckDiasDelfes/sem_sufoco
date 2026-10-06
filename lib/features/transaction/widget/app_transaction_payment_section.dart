import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppTransactionPaymentSection extends StatelessWidget {
  const AppTransactionPaymentSection({
    super.key,
    this.selected,
    this.onSelected,
  });

  final PaymentMethod? selected;
  final ValueChanged<PaymentMethod>? onSelected;

  @override
  Widget build(BuildContext context) {
    Widget option(PaymentMethod method, IconData icon, String label) {
      return Expanded(
        child: _PaymentOption(
          icon: icon,
          label: label,
          selected: selected == method,
          onTap: () => onSelected?.call(method),
        ),
      );
    }

    return SizedBox(
      height: 72,
      child: Row(
        spacing: 10,
        children: [
          option(PaymentMethod.creditCard, Icons.credit_card, 'Crédito'),
          option(
            PaymentMethod.debitCard,
            Icons.account_balance_wallet_outlined,
            'Débito',
          ),
          option(PaymentMethod.pix, Icons.pix, 'Pix'),
          option(PaymentMethod.cash, Icons.money, 'Dinheiro'),
        ],
      ),
    );
  }
}

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(12);

    return Material(
      color: selected ? const Color(0xFF14543C) : const Color(0xFF0A2B20),
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: selected ? AppColors.accent : const Color(0xFF1B3026),
              width: selected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selected ? Icons.check_circle : icon,
                color: AppColors.accent,
                size: 22,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
