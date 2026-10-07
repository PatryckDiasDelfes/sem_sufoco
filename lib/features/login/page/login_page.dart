import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/login/controller/login_controller.dart';
import 'package:sem_sufoco/features/login/page/auth_error_banner.dart';
import 'package:sem_sufoco/features/login/page/auth_text_field.dart';
import 'package:sem_sufoco/features/login/page/labeled_divider.dart';
import 'package:sem_sufoco/features/login/page/login_header.dart';
import 'package:sem_sufoco/features/login/page/primary_button.dart';
import 'package:sem_sufoco/features/login/page/social_login_row.dart';

/// Apenas injeta o controller. Se preferir, mova esse Provider para o router.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginController>(
      create: (_) => LoginController(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  Future<void> _handle(BuildContext context, Future<bool> future) async {
    final success = await future;
    if (success && context.mounted) context.go('/MainHomePage');
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();

    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        backgroundColor: AppColors.backGround,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Entrar',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
            children: [
              const LoginHeader(),
              const SizedBox(height: 28),

              if (controller.errorMessage != null) ...[
                AuthErrorBanner(message: controller.errorMessage!),
                const SizedBox(height: 16),
              ],

              AuthTextField(
                controller: controller.emailController,
                label: 'E-mail',
                icon: Icons.mail_outline_rounded,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
                enabled: !controller.isLoading,
                validator: controller.validateEmail,
                onChanged: (_) => controller.clearError(),
              ),
              const SizedBox(height: 16),

              AuthTextField(
                controller: controller.passwordController,
                label: 'Senha',
                icon: Icons.lock_outline_rounded,
                obscureText: controller.obscurePassword,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.password],
                enabled: !controller.isLoading,
                validator: controller.validatePassword,
                onChanged: (_) => controller.clearError(),
                onSubmitted: (_) => _handle(context, controller.submit()),
                suffix: IconButton(
                  onPressed: controller.toggleObscurePassword,
                  icon: Icon(
                    controller.obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                    color: AppColors.gray200,
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.isLoading
                      ? null
                      : () {
                          // TODO: context.push('/forgot-password');
                        },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('Esqueci minha senha'),
                ),
              ),
              const SizedBox(height: 20),

              PrimaryButton(
                label: 'ENTRAR',
                isLoading: controller.isLoading,
                onPressed: () => _handle(context, controller.submit()),
              ),

              // Atalho de desenvolvimento: só aparece em debug.
              if (kDebugMode) ...[
                const SizedBox(height: 12),
                PrimaryButton(
                  label: 'Teste',
                  onPressed: () => context.push('/extract'),
                ),
              ],

              const SizedBox(height: 32),
              const LabeledDivider(label: 'ou entre com'),
              const SizedBox(height: 24),

              SocialLoginRow(
                enabled: !controller.isLoading,
                onSelected: (provider) =>
                    _handle(context, controller.loginWithSocial(provider)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
