import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../core/constants/categories.dart';
import '../../../core/theme/app_colors.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

 
  static const Map<String, int> _transactionCounts = {
    'Alimentação': 15,
    'Transporte': 5,
    'Assinaturas': 8,
    'Compras': 12,
    'Lazer': 0,
    'Food': 0,
  };

  @override
  Widget build(BuildContext context) {
    final categories = getCategories();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categorias',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Symbols.settings, color: AppColors.primary),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.3,
                  children: [
                    for (final category in categories)
                      _CategoryCard(
                        name: category,
                        count: _transactionCounts[category] ?? 0,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String name;
  final int count;

  const _CategoryCard({required this.name, required this.count});

  Widget _buildIcon() {
    
    if (name == Categories.alimentacao) {
      return Icon(CategoriasIconData.alimentacao, color: const Color.fromARGB(255, 1, 253, 115), size: 28);
    }

    
    final iconPath = {
      Categories.alimentacao: CategoriasIcons.alimentacao,
      Categories.transporte: CategoriasIcons.transporte,
      Categories.compras: CategoriasIcons.compras,
      Categories.assinaturas: CategoriasIcons.assinaturas,
    }[name];

   
    if (iconPath == null) {
      return const Icon(Icons.add, color: Colors.black, size: 28);
    }
    return Image.asset(iconPath, width: 28, height: 28);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(),
          const Spacer(),
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$count transações',
            style: const TextStyle(color: Colors.black87, fontSize: 12),
          ),
        ],
      ),
    );
  }
}