import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// =========================
// Armazenamento Seguro
// =========================

class SecureAuthStorage extends LocalStorage {
  static const String _rememberMeKey = 'remember_me';

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  late SharedPreferences _preferences;

  // =========================
  // Inicialização
  // =========================

  @override
  Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();

    final rememberMe = _preferences.getBool(_rememberMeKey) ?? false;

    if (!rememberMe) {
      await _secureStorage.delete(key: supabasePersistSessionKey);

      await _preferences.remove(supabasePersistSessionKey);
      return;
    }

    // Migra uma sessão antiga para o armazenamento seguro.
    final secureSession = await _secureStorage.read(
      key: supabasePersistSessionKey,
    );

    if (secureSession == null) {
      final oldSession = _preferences.getString(supabasePersistSessionKey);

      if (oldSession != null) {
        await _secureStorage.write(
          key: supabasePersistSessionKey,
          value: oldSession,
        );

        await _preferences.remove(supabasePersistSessionKey);
      }
    }
  }

  // =========================
  // Verificar Sessão
  // =========================

  @override
  Future<bool> hasAccessToken() async {
    final rememberMe = _preferences.getBool(_rememberMeKey) ?? false;

    if (!rememberMe) return false;

    return _secureStorage.containsKey(key: supabasePersistSessionKey);
  }

  // =========================
  // Recuperar Sessão
  // =========================

  @override
  Future<String?> accessToken() async {
    final rememberMe = _preferences.getBool(_rememberMeKey) ?? false;

    if (!rememberMe) return null;

    return _secureStorage.read(key: supabasePersistSessionKey);
  }

  // =========================
  // Salvar Sessão
  // =========================

  @override
  Future<void> persistSession(String persistSessionString) async {
    final rememberMe = _preferences.getBool(_rememberMeKey) ?? false;

    if (!rememberMe) {
      await _secureStorage.delete(key: supabasePersistSessionKey);

      await _preferences.remove(supabasePersistSessionKey);
      return;
    }

    await _secureStorage.write(
      key: supabasePersistSessionKey,
      value: persistSessionString,
    );
  }

  // =========================
  // Remover Sessão
  // =========================

  @override
  Future<void> removePersistedSession() async {
    await _secureStorage.delete(key: supabasePersistSessionKey);
  }
}
