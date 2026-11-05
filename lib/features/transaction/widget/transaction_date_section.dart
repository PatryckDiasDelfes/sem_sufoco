import 'package:flutter/material.dart';

import 'package:sem_sufoco/features/transaction/widget/transaction_info_field.dart';

// =========================
// Transaction Date Section
// =========================

class TransactionDateSection extends StatelessWidget {
  const TransactionDateSection({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onSelectDate,
    required this.onSelectTime,
  });

  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final VoidCallback onSelectDate;
  final VoidCallback onSelectTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TransactionInfoField(
            labelTitle: selectedDate == null
                ? 'Data'
                : '${selectedDate!.day.toString().padLeft(2, '0')}/'
                      '${selectedDate!.month.toString().padLeft(2, '0')}/'
                      '${selectedDate!.year}',
            icon: Icons.calendar_today_outlined,
            readOnly: true,
            onTap: onSelectDate,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TransactionInfoField(
            labelTitle: selectedTime == null
                ? 'Horário'
                : selectedTime!.format(context),
            icon: Icons.access_time,
            readOnly: true,
            onTap: onSelectTime,
          ),
        ),
      ],
    );
  }
}
