import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/login/controller/login_controller.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.asset,
    required this.label,
    required this.onTap,
    this.tint,
  });

  final String asset;
  final String label;
  final VoidCallback? onTap;
  final Color? tint;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: Material(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: SizedBox(
            width: 64,
            height: 56,
            child: Center(
              child: SvgPicture.asset(
                asset,
                width: 26,
                height: 26,
                colorFilter: tint == null
                    ? null
                    : ColorFilter.mode(tint!, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({
    super.key,
    required this.onSelected,
    this.enabled = true,
  });

  final ValueChanged<SocialProvider> onSelected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    VoidCallback? tap(SocialProvider p) =>
        enabled ? () => onSelected(p) : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginButton(
          asset: 'assets/icons/google.svg',
          label: 'Entrar com Google',
          onTap: tap(SocialProvider.google),
        ),
        const SizedBox(width: 16),
        SocialLoginButton(
          asset: 'assets/icons/facebook.svg',
          label: 'Entrar com Facebook',
          onTap: tap(SocialProvider.facebook),
        ),
        const SizedBox(width: 16),
        SocialLoginButton(
          asset: 'assets/icons/X.svg',
          label: 'Entrar com X',
          tint: Colors.white,
          onTap: tap(SocialProvider.x),
        ),
      ],
    );
  }
}
