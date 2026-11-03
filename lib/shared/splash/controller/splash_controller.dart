import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashController extends ChangeNotifier {
  // =========================
  // Verificação da Sessão
  // =========================

  Future<String> checkSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final rememberMe = prefs.getBool('remember_me') ?? false;

      final session = Supabase.instance.client.auth.currentSession;

      // =========================
      // Sessão Autorizada
      // =========================

      if (rememberMe && session != null) {
        debugPrint('Sessão encontrada. Redirecionando para Home.');

        return '/MainHomePage';
      }

      // =========================
      // Sessão Não Autorizada
      // =========================

      if (session != null && !rememberMe) {
        await Supabase.instance.client.auth.signOut();
      }

      debugPrint('Redirecionando para Login.');

      return '/login';
    } catch (error) {
      debugPrint('Erro ao verificar sessão: $error');

      return '/login';
    }
  }
}
