import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/utils.dart';

class AppCardCategory extends StatelessWidget {
  const AppCardCategory({
    super.key,
    required this.category,
    required this.price,
    required this.icon,
    required this.color,
  });

  final String category;
  final double price;
  final Widget icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shodownBox,
              blurRadius: 4, // O desfoque da sombra
              // O quanto a sombra se espalha
            ),
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
              const Expanded(child: SizedBox()),
              Expanded(child: Text(category, style: AppTextStyle.extrectSub)),

              Expanded(
                child: Text(
                  utils.formatCurrency(price),
                  style: AppTextStyle.homePriceWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
