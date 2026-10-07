import 'package:flutter/material.dart';

enum SocialProvider { google, facebook, x }

class LoginController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;
  String? _errorMessage;
  bool _disposed = false;

  bool get obscurePassword => _obscurePassword;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // ---------------------------------------------------------------------------
  // Validações
  // ---------------------------------------------------------------------------
  static final _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Informe seu e-mail';
    if (!_emailRegex.hasMatch(email)) return 'E-mail inválido';
    return null;
  }

  String? validatePassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) return 'Informe sua senha';
    if (password.length < 6) return 'A senha deve ter ao menos 6 caracteres';
    return null;
  }

  // ---------------------------------------------------------------------------
  // Ações
  // ---------------------------------------------------------------------------
  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    _notify();
  }

  void clearError() {
    if (_errorMessage == null) return;
    _errorMessage = null;
    _notify();
  }

  /// Login com e-mail e senha. Retorna `true` se autenticou com sucesso.
  Future<bool> submit() async {
    if (_isLoading) return false;

    _errorMessage = null;
    if (!(formKey.currentState?.validate() ?? false)) {
      _notify();
      return false;
    }

    return _run(() async {
      final email = emailController.text.trim();
      final password = passwordController.text;

      // TODO: trocar pela chamada real (AuthRepository / Firebase / API).
      await Future.delayed(const Duration(milliseconds: 800));
      debugPrint('Login: $email (${password.length} chars)');
    });
  }

  /// Login social. Retorna `true` se autenticou com sucesso.
  Future<bool> loginWithSocial(SocialProvider provider) async {
    if (_isLoading) return false;

    return _run(() async {
      // TODO: integrar cada provedor (google_sign_in, facebook, X).
      await Future.delayed(const Duration(milliseconds: 800));
      debugPrint('Login social: ${provider.name}');
    });
  }

  Future<bool> _run(Future<void> Function() action) async {
    _isLoading = true;
    _errorMessage = null;
    _notify();

    try {
      await action();
      return true;
    } catch (_) {
      _errorMessage = 'Não foi possível entrar. Tente novamente.';
      return false;
    } finally {
      _isLoading = false;
      _notify();
    }
  }

  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
