import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/home/controllers/GraphicController.dart';

class AppTitleGraphic extends StatelessWidget {
  const AppTitleGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GraphicController>(
      builder: (context, controller, _) {
        final color = controller.isGrowing
            ? AppColors.accent
            : Colors.redAccent;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Row(
              spacing: 20,
              children: [
                Icon(Icons.wallet_outlined, color: AppColors.accent),
                Text(
                  'Saldo atual',
                  style: TextStyle(color: AppColors.white, fontSize: 12),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Text(controller.balanceText, style: AppTextStyle.subTitle),
                GestureDetector(
                  onTap: controller.toggleBalance,
                  child: Icon(
                    controller.showBalance
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 5,
              children: [
                Icon(
                  controller.isGrowing
                      ? Icons.arrow_outward_rounded
                      : Icons.south_east_rounded,
                  color: color,
                ),
                Text(
                  controller.percentText,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'em relação ao mês anterior',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
