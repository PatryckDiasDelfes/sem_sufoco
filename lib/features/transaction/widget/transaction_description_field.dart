import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';

// =========================
// Transaction Description Field
// =========================

class TransactionDescriptionField extends StatelessWidget {
  const TransactionDescriptionField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      cursorColor: AppColors.colorsTheme,
      maxLines: 3,
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: Icon(Icons.receipt_long_outlined, color: AppColors.accent),
        ),
        hintText: 'Adicionar descrição',
        hintStyle: TextStyle(color: AppColors.white, fontSize: 14),
        border: InputBorder.none,
      ),
    );
  }
}
