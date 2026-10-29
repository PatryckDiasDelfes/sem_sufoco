import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/model/category.dart';
import '../../../shared/mocks/category_mock.dart';

class CategoryController extends ChangeNotifier {
  List<Category> categories = [];
  bool isLoading = false;
  String? errorMessage;

  // =========================
  // Carregar Categorias
  // =========================

  Future<void> loadCategories({String? type}) async {
    if (isLoading) return;

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final supabase = Supabase.instance.client;

      final baseQuery = supabase
          .from('categories')
          .select('id, name, icon, type');

      final data = type != null
          ? await baseQuery.eq('type', type).order('name')
          : await baseQuery.order('name');

      final mockColors = <String, Color>{
        for (final category in mockCategories) category.name: category.color,
      };

      categories = data.map<Category>((item) {
        final id = item['id'].toString();
        final name = item['name'] as String;
        final iconName = item['icon'] as String? ?? 'category';

        return Category(
          id: id,
          name: name,
          icon: _getIcon(iconName),
          color: mockColors[name] ?? Colors.teal,
        );
      }).toList();
    } catch (error, stackTrace) {
      errorMessage = 'Não foi possível carregar as categorias.';
      debugPrint('Erro ao carregar categorias: $error');
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // =========================
  // Atualizar Categorias
  // =========================

  Future<void> refreshCategories({String? type}) async {
    await loadCategories(type: type);
  }

  // =========================
  // Converter Ícones
  // =========================

  IconData _getIcon(String name) {
    const icons = <String, IconData>{
      'restaurant': Icons.restaurant,
      'home': Icons.home,
      'directions_car': Icons.directions_car,
      'medical_services': Icons.medical_services,
      'sports_esports': Icons.sports_esports,
      'shopping_bag': Icons.shopping_bag,
      'school': Icons.school,
      'category': Icons.category,
      'pets': Icons.pets,
      'payments': Icons.payments,
      'work': Icons.work,
      'laptop': Icons.laptop,
      'sell': Icons.sell,
      'trending_up': Icons.trending_up,
      'card_giftcard': Icons.card_giftcard,
      'replay': Icons.replay,
      'redeem': Icons.redeem,
      'account_balance_wallet': Icons.account_balance_wallet,
    };

    return icons[name] ?? Icons.category;
  }
}
