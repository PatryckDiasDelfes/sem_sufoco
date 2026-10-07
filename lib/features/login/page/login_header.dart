import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    this.title = 'Bem-vindo de volta',
    this.subtitle = 'Entre para continuar no Sem Sufoco',
    this.logoAsset = 'assets/images/logo.svg',
  });

  final String title;
  final String subtitle;
  final String? logoAsset;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (logoAsset != null) ...[
          SvgPicture.asset(logoAsset!, height: 56),
          const SizedBox(height: 24),
        ],
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.gray200,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
