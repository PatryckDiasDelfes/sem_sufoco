import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';

enum ButtonType { filled, outlined, addToCart, smalButton }

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.label,
    this.onPressed,
    required this.type,
    required this.backgroundColor,
    this.isLoading = false,
    this.isHeight,
    this.isWidth,
    this.isStyle,
  });

  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final Color backgroundColor;
  final bool isLoading;
  final double? isHeight;
  final double? isWidth;
  final TextStyle? isStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _getStyle(),
      child: isLoading
          ? SizedBox(
              height: isHeight ?? 20,
              width: isWidth ?? 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: type == ButtonType.filled
                    ? AppColors.white
                    : AppColors.black,
              ),
            )
          : Text(label, style: isStyle ?? AppTextStyle.buttonLabel),
    );
  }

  ButtonStyle _getStyle() {
    switch (type) {
      case ButtonType.filled:
        return ElevatedButton.styleFrom(
          minimumSize: const Size(48, 48),
          foregroundColor: AppColors.white,
          backgroundColor: backgroundColor,
          disabledForegroundColor: AppColors.white,
          disabledBackgroundColor: backgroundColor,
          textStyle: AppTextStyle.buttonLabel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      case ButtonType.outlined:
        return ElevatedButton.styleFrom(
          minimumSize: const Size(48, 48),
          foregroundColor: AppColors.black,
          backgroundColor: backgroundColor,
          disabledForegroundColor: AppColors.white,
          disabledBackgroundColor: backgroundColor,
          textStyle: AppTextStyle.buttonLabel,

          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.black),
            borderRadius: BorderRadius.circular(12),
          ),
        );
      case ButtonType.addToCart:
        return ElevatedButton.styleFrom(
          minimumSize: const Size(48, 48),
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.black,
          disabledForegroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.black,
          textStyle: AppTextStyle.buttonLabel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      case ButtonType.smalButton:
        return ElevatedButton.styleFrom(
          minimumSize: const Size(20, 55),
          foregroundColor: AppColors.black,
          backgroundColor: AppColors.gray200,
          disabledForegroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.black,
          textStyle: AppTextStyle.buttonLabel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        );
    }
  }
}
