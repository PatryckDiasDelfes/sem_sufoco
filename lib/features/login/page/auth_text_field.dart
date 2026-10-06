import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
    this.validator,
    this.obscureText = false,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;

  OutlineInputBorder _border(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      cursorColor: AppColors.textPrimary,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyle.bodySmall.copyWith(color: AppColors.gray200),
        floatingLabelStyle: AppTextStyle.bodySmall.copyWith(
          color: AppColors.primary,
        ),
        filled: true,
        fillColor: AppColors.bg,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        prefixIcon: icon == null
            ? null
            : Icon(icon, size: 20, color: AppColors.gray200),
        suffixIcon: suffix,
        errorStyle: const TextStyle(color: AppColors.danger, fontSize: 12),
        enabledBorder: _border(AppColors.colorsTheme, 1),
        disabledBorder: _border(AppColors.colorsTheme, 1),
        focusedBorder: _border(AppColors.primary, 2),
        errorBorder: _border(AppColors.danger, 1),
        focusedErrorBorder: _border(AppColors.danger, 2),
      ),
    );
  }
}
