import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AllCategoriesSheet extends StatelessWidget {
  const AllCategoriesSheet(
    BuildContext context, {
    super.key,
    required this.categories,
    this.selectedCategoryId,
    this.onSelected,
  });

  final List<Category> categories;
  final String? selectedCategoryId;
  final ValueChanged<Category>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.05,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];

          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              onSelected?.call(category);
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: selectedCategoryId == category.id
                    ? AppColors.primary
                    : AppColors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category.icon,
                    size: 26,
                    color: selectedCategoryId == category.id
                        ? Colors.white
                        : AppColors.primary,
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
        },
      ),
    );
  }
}
