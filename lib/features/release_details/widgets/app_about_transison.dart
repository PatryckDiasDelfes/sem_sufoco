import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/home/widgets/app_line.dart';

class AppAboutTransison extends StatelessWidget {
  const AppAboutTransison({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shodownBox,
            blurRadius: 4, // O desfoque da sombra
            // O quanto a sombra se espalha
          ),
        ],
        border: Border.all(color: AppColors.cardGreen, width: 1),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sobre a transação',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined, color: AppColors.accent),
              SizedBox(width: 16),
              Text(
                'Data da compra',
                style: TextStyle(color: AppColors.grey, fontSize: 14),
              ),
              Spacer(),
              Text(
                'Terça-feira, 22/09/2026',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Icon(Icons.access_time, color: AppColors.accent),
              SizedBox(width: 16),
              Text(
                'Horário',
                style: TextStyle(color: AppColors.grey, fontSize: 14),
              ),
              Spacer(),
              Text(
                '09:57',
                style: TextStyle(
                  color: AppColors.white,
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
              Icon(Icons.storefront_outlined, color: AppColors.accent),
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
                        color: AppColors.white,
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
          AppLine(size: 1),
          SizedBox(height: 24),
          Row(
            children: [
              Icon(Icons.receipt_long_outlined, color: AppColors.accent),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Adicionar descrição',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: AppColors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
