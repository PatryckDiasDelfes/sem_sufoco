import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';

class AppTransactionPaymentSection extends StatelessWidget {
  const AppTransactionPaymentSection({
    super.key,
    required this.selectedPaymentMethod,
    required this.onSelected,
  });

  final PaymentMethod? selectedPaymentMethod;
  final ValueChanged<PaymentMethod> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // =========================
        // Formas de pagamento
        // =========================
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: _PaymentOption(
                icon: Icons.credit_card,
                label: 'Crédito',
                selected: selectedPaymentMethod == PaymentMethod.creditCard,
                onTap: () {
                  onSelected(PaymentMethod.creditCard);
                },
              ),
            ),

            Expanded(
              child: _PaymentOption(
                icon: Icons.account_balance_wallet_outlined,
                label: 'Débito',
                selected: selectedPaymentMethod == PaymentMethod.debitCard,
                onTap: () {
                  onSelected(PaymentMethod.debitCard);
                },
              ),
            ),

            Expanded(
              child: _PaymentOption(
                icon: Icons.pix,
                label: 'Pix',
                selected: selectedPaymentMethod == PaymentMethod.pix,
                onTap: () {
                  onSelected(PaymentMethod.pix);
                },
              ),
            ),

            Expanded(
              child: _PaymentOption(
                icon: Icons.money,
                label: 'Dinheiro',
                selected: selectedPaymentMethod == PaymentMethod.cash,
                onTap: () {
                  onSelected(PaymentMethod.cash);
                },
              ),
            ),
          ],
        ),

        // =========================
        // Pagamento selecionado
        // =========================
        if (selectedPaymentMethod != null) ...[
          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(Icons.check_circle, size: 18, color: AppColors.accent),

              const SizedBox(width: 8),

              Text(
                'Pagamento selecionado: ',
                style: AppTextStyle.bodySmall.copyWith(color: Colors.grey),
              ),

              Expanded(
                child: Text(
                  _paymentMethodName(selectedPaymentMethod!),
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  // =========================
  // Nome do pagamento
  // =========================

  String _paymentMethodName(PaymentMethod paymentMethod) {
    switch (paymentMethod) {
      case PaymentMethod.creditCard:
        return 'Crédito';

      case PaymentMethod.debitCard:
        return 'Débito';

      case PaymentMethod.pix:
        return 'Pix';

      case PaymentMethod.cash:
        return 'Dinheiro';
    }
  }
}

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.selected,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;

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

          border: Border.all(
            color: selected ? AppColors.accent : const Color(0xFF1B3026),
          ),
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
