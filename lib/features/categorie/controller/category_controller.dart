import 'package:flutter/material.dart';

import '../../../core/model/category.dart';
import '../../../shared/mocks/category_mock.dart';

class CategoryController extends ChangeNotifier {
  List<Category> categories = [];

  // =========================
  // Carregar categorias
  // =========================

  void loadCategories() {
    categories = [...mockCategories];

    categories.sort((a, b) => a.name.compareTo(b.name));

    notifyListeners();
  }
}
