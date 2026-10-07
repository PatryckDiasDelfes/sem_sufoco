import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppTransactionPaymentSection extends StatelessWidget {
  const AppTransactionPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: _PaymentOption(
            icon: Icons.credit_card,
            label: 'Crédito',
            onTap: () {},
          ),
        ),

        Expanded(
          child: _PaymentOption(
            icon: Icons.account_balance_wallet_outlined,
            label: 'Débito',
            onTap: () {},
          ),
        ),
        Expanded(
          child: _PaymentOption(icon: Icons.pix, label: 'Pix', onTap: () {}),
        ),

        Expanded(
          child: _PaymentOption(
            icon: Icons.money,
            label: 'Dinheiro',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF0A2B20),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1B3026)),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.accent, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
