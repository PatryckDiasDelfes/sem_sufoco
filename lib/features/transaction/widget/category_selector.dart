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

  @override
  Widget build(BuildContext context) {
    final categories = widget.categories.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Categorias', style: AppTextStyle.subTitle),

            const Spacer(),

            IconButton(
              onPressed: () =>
                  AllCategoriesSheet(context, categories: widget.categories),
              icon: const Icon(Icons.more_horiz, color: Colors.white),
            ),
          ],
        ),

        const SizedBox(height: 10),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];

            return _card(
              icon: category.icon,
              name: category.name,
              selected: selectedCategoryId == category.id,
              onTap: () {
                setState(() {
                  selectedCategoryId = category.id;
                });

                widget.onSelected?.call(category);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _card({
    required IconData icon,
    required String name,
    required VoidCallback onTap,
    bool selected = false,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 26,
              color: selected ? Colors.white : AppColors.primary,
            ),

            const SizedBox(height: 7),

            Text(
              name,
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
