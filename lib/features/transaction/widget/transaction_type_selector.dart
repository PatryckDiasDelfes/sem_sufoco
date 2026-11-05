import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

// =========================
// Transaction Type Selector
// =========================

class TransactionTypeSelector extends StatelessWidget {
  const TransactionTypeSelector({
    super.key,
    required this.selectedType,
    required this.onSelected,
  });

  final TransactionType selectedType;
  final ValueChanged<TransactionType> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _TypeButton(
            label: 'Entrada',
            icon: Icons.arrow_downward,
            type: TransactionType.income,
            selectedType: selectedType,
            onSelected: onSelected,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _TypeButton(
            label: 'Saída',
            icon: Icons.arrow_upward,
            type: TransactionType.expense,
            selectedType: selectedType,
            onSelected: onSelected,
          ),
        ),
      ],
    );
  }
}

// =========================
// Type Button
// =========================

class _TypeButton extends StatelessWidget {
  const _TypeButton({
    required this.label,
    required this.icon,
    required this.type,
    required this.selectedType,
    required this.onSelected,
  });

  final String label;
  final IconData icon;
  final TransactionType type;
  final TransactionType selectedType;
  final ValueChanged<TransactionType> onSelected;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedType == type;

    return GestureDetector(
      onTap: () => onSelected(type),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.cardGreen : AppColors.bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.accent : AppColors.cardGreen,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: AppColors.accent),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
