import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

import '../controller/category_controller.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CategoriesView();
  }
}

// =========================
// Conteúdo da página
// =========================

class _CategoriesView extends StatelessWidget {
  const _CategoriesView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CategoryController>();

    // =========================
    // Carregamento
    // =========================

    if (controller.isLoading && controller.categories.isEmpty) {
      return const Scaffold(
        backgroundColor: AppColors.backGround,
        body: Center(child: CircularProgressIndicator(color: AppColors.accent)),
      );
    }

    // =========================
    // Tratamento de Erros
    // =========================

    if (controller.errorMessage != null && controller.categories.isEmpty) {
      return Scaffold(
        backgroundColor: AppColors.backGround,
        appBar: AppBar(
          backgroundColor: AppColors.backGround,
          foregroundColor: Colors.white,
          title: const Text('Categorias'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => controller.refreshCategories(),
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // =========================
    // Página de Categorias
    // =========================

    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backGround,
        centerTitle: true,
        title: const Text(
          'Categorias',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshCategories,
        color: AppColors.accent,
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            final category = controller.categories[index];

            return InkWell(
              onTap: () {
                context.push('/CategoryExtractPage', extra: category);
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.accent),
                  boxShadow: const [
                    BoxShadow(color: AppColors.shodownBox, blurRadius: 4),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(category.icon, size: 28, color: AppColors.accent),
                    const SizedBox(height: 8),
                    Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
