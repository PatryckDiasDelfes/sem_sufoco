import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/models/transaction.dart';

class TypeToggle extends StatelessWidget {
  const TypeToggle({super.key, required this.value, required this.onChanged});

  final TransactionType value;
  final ValueChanged<TransactionType> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SegmentedButton<TransactionType>(
        showSelectedIcon: false,
        segments: const [
          ButtonSegment(
            value: TransactionType.expense,
            label: Text('Despesa'),
            icon: Icon(Icons.arrow_downward),
          ),
          ButtonSegment(
            value: TransactionType.income,
            label: Text('Receita'),
            icon: Icon(Icons.arrow_upward),
          ),
        ],
        selected: {value},
        onSelectionChanged: (selection) => onChanged(selection.first),
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size.fromHeight(48)),
          side: const WidgetStatePropertyAll(
            BorderSide(color: AppColors.darkBorder),
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? AppColors.accent
                : AppColors.darkSurface,
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? AppColors.darkBackground
                : AppColors.labelGray,
          ),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
