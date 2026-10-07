import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/utils.dart';

class AppCardCategory extends StatelessWidget {
  const AppCardCategory({
    super.key,
    required this.category,
    required this.price,
    required this.priceColor,
    required this.icon,
    required this.color,
  });

  final String category;
  final double price;
  final Color priceColor;
  final Widget icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();

    final priceText = price >= 0
        ? '+${utils.formatCurrency(price)}'
        : '-${utils.formatCurrency(price.abs())}';

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.bg,
          border: Border.all(color: AppColors.cardGreen, width: 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Color.fromARGB(255, 112, 91, 91), blurRadius: 4),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(padding: const EdgeInsets.all(4.0), child: icon),
              ),

              const Spacer(),

              Text(category, style: AppTextStyle.extrectSub),

              const SizedBox(height: 4),

              Text(
                priceText,
                style: AppTextStyle.homePriceWhite.copyWith(color: priceColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
