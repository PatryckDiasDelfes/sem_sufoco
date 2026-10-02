import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/transaction/widget/all_categories_sheet.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    super.key,
    required this.categories,
    this.onSelected,
  });

  final List<Category> categories;
  final ValueChanged<Category>? onSelected;

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String? selectedCategoryId;

  void _selectCategory(Category category) {
    setState(() => selectedCategoryId = category.id);
    widget.onSelected?.call(category);
  }

  @override
  Widget build(BuildContext context) {
    final visibleCategories = widget.categories.take(3).toList();

    final selected = widget.categories
        .where((category) => category.id == selectedCategoryId)
        .firstOrNull;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Categorias', style: AppTextStyle.subTitle),
            const Spacer(),
            IconButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                backgroundColor: AppColors.background,
                isScrollControlled: true,
                builder: (_) => AllCategoriesSheet(
                  categories: widget.categories,
                  selectedCategoryId: selectedCategoryId,
                  onSelected: _selectCategory,
                ),
              ),
              icon: const Icon(Icons.more_horiz, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: visibleCategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (_, index) {
            final category = visibleCategories[index];

            return _card(category, selected: category.id == selectedCategoryId);
          },
        ),
        if (selected != null) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.check_circle, size: 18, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                'Categoria selecionada: ',
                style: AppTextStyle.bodySmall.copyWith(color: Colors.grey),
              ),
              Expanded(
                child: Text(
                  selected.name,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _card(Category category, {bool selected = false}) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => _selectCategory(category),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.backGround,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              size: 26,
              color: selected ? Colors.white : AppColors.primary,
            ),
            const SizedBox(height: 7),
            Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
