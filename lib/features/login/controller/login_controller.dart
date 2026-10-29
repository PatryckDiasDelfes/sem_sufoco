import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  // =========================
  // Validações
  // =========================
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
    if (password.length < 6) {
      return 'A senha deve ter ao menos 6 caracteres';
    }

    return null;
  }

  // =========================
  // Ações
  // =========================
  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    _notify();
  }

  void clearError() {
    if (_errorMessage == null) return;

    _errorMessage = null;
    _notify();
  }

  // =========================
  // Login com Supabase
  // =========================
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

      await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    });
  }

  // =========================
  // Login Social
  // =========================
  Future<bool> loginWithSocial(SocialProvider provider) async {
    if (_isLoading) return false;

    return _run(() async {
      // TODO: Integrar Google, Facebook e X.
      throw UnimplementedError(
        'Login com ${provider.name} ainda não foi integrado.',
      );
    });
  }

  // =========================
  // Execução e Tratamento de Erros
  // =========================
  Future<bool> _run(Future<void> Function() action) async {
    _isLoading = true;
    _errorMessage = null;
    _notify();

    try {
      await action();
      return true;
    } on AuthException catch (error) {
      final message = error.message.toLowerCase();

      if (message.contains('invalid login credentials')) {
        _errorMessage = 'E-mail ou senha incorretos.';
      } else if (message.contains('email not confirmed')) {
        _errorMessage = 'Confirme seu e-mail antes de entrar.';
      } else {
        debugPrint('Erro de autenticação: ${error.message}');
        _errorMessage = 'Não foi possível autenticar. Tente novamente.';
      }

      return false;
    } catch (error) {
      debugPrint('Erro inesperado no login: $error');
      _errorMessage =
          'Erro de conexão. Verifique sua internet e tente novamente.';

      return false;
    } finally {
      _isLoading = false;
      _notify();
    }
  }

  // =========================
  // Atualização da Interface
  // =========================
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
