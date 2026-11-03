import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterController extends ChangeNotifier {
  // =========================
  // Controllers dos Campos
  // =========================

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // =========================
  // Estados
  // =========================

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  String? _errorMessage;
  bool _requiresEmailConfirmation = false;

  bool get obscurePassword => _obscurePassword;
  bool get obscureConfirmPassword => _obscureConfirmPassword;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get requiresEmailConfirmation => _requiresEmailConfirmation;

  // =========================
  // Visibilidade das Senhas
  // =========================

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _obscureConfirmPassword = !_obscureConfirmPassword;
    notifyListeners();
  }

  // =========================
  // Validações
  // =========================

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Informe seu nome.';
    }

    if (value.trim().length < 3) {
      return 'Digite seu nome completo.';
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Informe seu e-mail.';
    }

    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim())) {
      return 'Informe um e-mail válido.';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe uma senha.';
    }

    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres.';
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirme sua senha.';
    }

    if (value != passwordController.text) {
      return 'As senhas não coincidem.';
    }

    return null;
  }

  // =========================
  // Cadastro Supabase
  // =========================

  Future<bool> register() async {
    if (_isLoading) return false;

    _isLoading = true;
    _errorMessage = null;
    _requiresEmailConfirmation = false;
    notifyListeners();

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text,
        data: {'full_name': nameController.text.trim()},
      );

      _requiresEmailConfirmation = response.session == null;

      return true;
    } on AuthException catch (error) {
      _errorMessage = error.message;
      return false;
    } catch (error) {
      debugPrint('Erro no cadastro: $error');
      _errorMessage = 'Não foi possível realizar o cadastro. Tente novamente.';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // =========================
  // Dispose
  // =========================

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
