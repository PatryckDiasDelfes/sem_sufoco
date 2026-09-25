import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../core/constants/categories.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
  

    final items = [
      {'cat': kCategories[0], 'sub': '15 transações'},
      {'cat': kCategories[1], 'sub': '5 transações'},
      {'cat': kCategories[2], 'sub': '8 transações'},
      {'cat': kCategories[3], 'sub': '12 transações'},
      {'cat': kCategories[4], 'sub': ''},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Categorias',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: const [
          Icon(Symbols.settings, color: Color(0xFF5CCDA7)),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  final Category cat = items[index]['cat'] as Category;
                  final String sub = items[index]['sub'] as String;
                  return InkWell(
                   onTap: () => context.push('/gastos-categoria', extra: cat),
                    child: Container( 
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A2E1E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(cat.icon, size: 28, color: const Color(0xFF98FFE0)),
                        const SizedBox(height: 8),
                        Text(cat.name,
                          style: const TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold, fontSize: 13)),
                        if (sub.isNotEmpty)
                          Text(sub, style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 13)),
                      ],
                    ),
                  ),
                  );
                },
              ),
            ),
          ),
          Container(
            color: const Color(0xFF0A2E1E),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BottomItem(icon: Symbols.home, label: 'Início', active: true),
                _BottomItem(icon: Symbols.add_circle, label: 'Novo'),
                _BottomItem(icon: Symbols.flag, label: 'Metas'),
                _BottomItem(icon: Symbols.account_balance_wallet, label: 'Cashback'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  const _BottomItem({required this.icon, required this.label, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 26, color: Colors.white),
        const SizedBox(height: 2),
        Text(label,
          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900)),
      ],
    );
  }
}