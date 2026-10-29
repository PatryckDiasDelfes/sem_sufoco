import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  // Controllers dos campos
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Visibilidade das senhas
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  bool get obscurePassword => _obscurePassword;
  bool get obscureConfirmPassword => _obscureConfirmPassword;

  // Alternar visibilidade da senha
  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _obscureConfirmPassword = !_obscureConfirmPassword;
    notifyListeners();
  }

  // Validar nome
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Informe seu nome.';
    }

    if (value.trim().length < 3) {
      return 'Digite seu nome completo.';
    }

    return null;
  }

  // Validar e-mail
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Informe seu e-mail.';
    }

    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim())) {
      return 'Informe um e-mail válido.';
    }

    return null;
  }

  // Validar senha
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe uma senha.';
    }

    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres.';
    }

    return null;
  }

  // Confirmar senha
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirme sua senha.';
    }

    if (value != passwordController.text) {
      return 'As senhas não coincidem.';
    }

    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
