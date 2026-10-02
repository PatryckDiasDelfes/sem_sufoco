import 'package:flutter/material.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111E18),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF1B3026)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sobre a transação',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined, color: Color(0xFF00BFA5)),
              SizedBox(width: 16),
              Text(
                'Data da compra',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Spacer(),
              Text(
                'Terça-feira, 22/09/2026',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Icon(Icons.access_time, color: Color(0xFF00BFA5)),
              SizedBox(width: 16),
              Text(
                'Horário',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Spacer(),
              Text(
                '09:57',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.storefront_outlined, color: Color(0xFF00BFA5)),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estabelecimento',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Lucca Cantina E Restaublumenau Bra',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Divider(color: Color(0xFF1B3026), height: 1),
          SizedBox(height: 24),
          Row(
            children: [
              Icon(Icons.receipt_long_outlined, color: Color(0xFF00BFA5)),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Adicionar descrição',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
