import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';

class TransactionInfoField extends StatelessWidget {
  const TransactionInfoField({
    super.key,
    required this.labelTitle,
    required this.icon,
    this.controller,
    this.onTap,
    this.readOnly = false,
  });

  final String labelTitle;
  final IconData icon;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ==========================================================
        // ÍCONE
        // ==========================================================
        Icon(icon, color: const Color(0xFF00BFA5)),

        const SizedBox(width: 16),

        // ==========================================================
        // CAMPO
        // ==========================================================
        Expanded(
          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,

            decoration: InputDecoration(
              labelText: labelTitle,

              labelStyle: AppTextStyle.bodySmall.copyWith(
                color: AppColors.gray200,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: AppColors.colorsTheme,
                  width: 1,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
            ),

            style: AppTextStyle.bodySmall.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
