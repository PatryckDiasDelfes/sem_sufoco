import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_style.dart';

class TransactionInfoField extends StatelessWidget {
  const TransactionInfoField({
    super.key,
    required this.labelTitle,
    required this.icon,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.value,
  });

  final String labelTitle;
  final IconData icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool readOnly;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly,
      style: AppTextStyle.bodySmall.copyWith(color: AppColors.white),
      cursorColor: AppColors.colorsTheme,
      decoration: InputDecoration(
        hintText: labelTitle,
        hintStyle: AppTextStyle.bodySmall.copyWith(color: AppColors.white),
        prefixIcon: Icon(icon, color: AppColors.accent),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
