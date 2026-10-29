import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/login/controller/login_controller.dart';
import 'package:sem_sufoco/features/login/widget/auth_text_field.dart';
import 'package:sem_sufoco/features/login/widget/labeled_divider.dart';
import 'package:sem_sufoco/features/login/widget/login_header.dart';
import 'package:sem_sufoco/features/login/widget/primary_button.dart';
import 'package:sem_sufoco/features/login/widget/social_login_row.dart';
import 'package:sem_sufoco/features/register/controller/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // Validar formulário
  void _register(RegisterController controller) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cadastro validado! Próxima etapa: integrar o Supabase.'),
      ),
    );
  }

  // Cadastro social ainda não implementado
  void _onSocialSelected(SocialProvider provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cadastro social ainda não implementado.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterController>(
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: AppColors.bg,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 440),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Cabeçalho
                        const LoginHeader(
                          title: 'Crie sua conta',
                          subtitle:
                              'Comece a organizar sua vida financeira '
                              'com o Sem Sufoco',
                        ),

                        const SizedBox(height: 32),

                        // Nome
                        AuthTextField(
                          controller: controller.nameController,
                          label: 'Nome completo',
                          icon: Icons.person_outline,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.name],
                          validator: controller.validateName,
                        ),

                        const SizedBox(height: 16),

                        // E-mail
                        AuthTextField(
                          controller: controller.emailController,
                          label: 'E-mail',
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.email],
                          validator: controller.validateEmail,
                        ),

                        const SizedBox(height: 16),

                        // Senha
                        AuthTextField(
                          controller: controller.passwordController,
                          label: 'Senha',
                          icon: Icons.lock_outline,
                          obscureText: controller.obscurePassword,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.newPassword],
                          suffix: IconButton(
                            onPressed: controller.togglePasswordVisibility,
                            icon: Icon(
                              controller.obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColors.gray200,
                            ),
                          ),
                          validator: controller.validatePassword,
                        ),

                        const SizedBox(height: 16),

                        // Confirmar senha
                        AuthTextField(
                          controller: controller.confirmPasswordController,
                          label: 'Confirmar senha',
                          icon: Icons.lock_outline,
                          obscureText: controller.obscureConfirmPassword,
                          textInputAction: TextInputAction.done,
                          autofillHints: const [AutofillHints.newPassword],
                          suffix: IconButton(
                            onPressed:
                                controller.toggleConfirmPasswordVisibility,
                            icon: Icon(
                              controller.obscureConfirmPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: AppColors.gray200,
                            ),
                          ),
                          validator: controller.validateConfirmPassword,
                          onSubmitted: (_) => _register(controller),
                        ),

                        const SizedBox(height: 24),

                        // Botão de cadastro
                        PrimaryButton(
                          label: 'Criar conta',
                          onPressed: () => _register(controller),
                        ),

                        const SizedBox(height: 28),

                        // Cadastro social
                        const LabeledDivider(label: 'ou cadastre-se com'),

                        const SizedBox(height: 20),

                        SocialLoginRow(onSelected: _onSocialSelected),

                        const SizedBox(height: 28),

                        // Voltar para o login
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Flexible(
                              child: Text(
                                'Já tem uma conta?',
                                style: TextStyle(
                                  color: AppColors.gray200,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => context.go('/login'),
                              child: const Text(
                                'Entrar',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
