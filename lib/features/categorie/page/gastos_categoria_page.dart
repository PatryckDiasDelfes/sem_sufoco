import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GastosCategoria extends StatelessWidget {
  const GastosCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF009D71);

    final items = [
      {
        'nome': 'Supermercado',
        'cat': 'Alimentação',
        'valor': '-18,10 R\$',
        'data': '15 de\nnovembro',
      },
      {
        'nome': 'Spotify Premium',
        'cat': 'Lazer',
        'valor': '-5,20 R\$',
        'data': '15 de\nnovembro',
      },
      {
        'nome': 'Aluguel do apartamento',
        'cat': 'Moradia',
        'valor': '-23,000\nR\$',
        'data': '15 de\nnovembro',
      },
      {
        'nome': 'Netflix',
        'cat': 'Assinatura',
        'valor': '-56,30\nR\$',
        'data': '15 de\nnovembro',
      },
    ];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'EXTRATO DETALHADO >',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ...items.map((item) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black26)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['nome']!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          item['cat']!,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    item['valor']!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(width: 12),
                  Text(
                    item['data']!,
                    style: const TextStyle(color: Colors.black54, fontSize: 10),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            );
          }).toList(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
