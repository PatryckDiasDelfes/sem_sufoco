import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/transaction/widget/all_categories_sheet.dart';

// =========================
// Category Selector
// =========================

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onSelected,
  });

  final List<Category> categories;
  final String? selectedCategoryId;
  final ValueChanged<Category> onSelected;

  // =========================
  // Selecionar Categoria
  // =========================

  void _selectCategory(Category category) {
    onSelected(category);
  }

  // =========================
  // Abrir Todas as Categorias
  // =========================

  void _openAllCategories(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bg,
      isScrollControlled: true,
      builder: (context) {
        return AllCategoriesSheet(
          categories: categories,
          selectedCategoryId: selectedCategoryId,
          onSelected: _selectCategory,
        );
      },
    );
  }

  // =========================
  // Interface
  // =========================

  @override
  Widget build(BuildContext context) {
    final visibleCategories = categories.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categoria',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ...visibleCategories.map((category) {
              final isSelected = category.id == selectedCategoryId;

              return GestureDetector(
                onTap: () => _selectCategory(category),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.cardGreen : AppColors.bg,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.accent
                          : AppColors.cardGreen,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(category.icon, color: category.color, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        category.name,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            GestureDetector(
              onTap: () => _openAllCategories(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.cardGreen),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.grid_view_rounded,
                      color: AppColors.accent,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Ver todas',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
