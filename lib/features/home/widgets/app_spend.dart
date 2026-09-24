import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/home/widgets/app_line.dart';
import 'package:sem_sufoco/utils.dart';

class AppSpend extends StatelessWidget {
  const AppSpend({
    super.key,
    required this.icone,
    required this.date,
    required this.price,
    required this.category,
    required this.name,
  });

  final Widget icone;
  final String date;
  final double price;
  final String category;
  final String name;

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils();
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 16),
      child: SizedBox(
        height: 50,
        child: Row(
          spacing: 10,
          children: [
            Container(
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.cardGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: icone,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(name, style: AppTextStyle.homeText),
                            Text(category, style: AppTextStyle.extrectSub),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            utils.formatCurrency(price),
                            style: AppTextStyle.homeValue,
                          ),
                          Text(date, style: AppTextStyle.extrectSub),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Icon(Icons.arrow_forward_ios, size: 15),
                      ),
                    ],
                  ),
                  AppLine(size: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
