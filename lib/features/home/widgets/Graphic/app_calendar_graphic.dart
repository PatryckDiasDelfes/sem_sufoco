import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/home/controllers/GraphicController.dart';

class AppCalendarGraphic extends StatelessWidget {
  const AppCalendarGraphic({super.key});

  void _openMonthPicker(BuildContext context) {
    // Lido aqui porque o bottom sheet pode ficar fora do alcance do Provider
    final controller = context.read<GraphicController>();
    final months = controller.availableMonths.reversed.toList();

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bg,
      builder: (sheetContext) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: months.length,
          itemBuilder: (_, index) {
            final month = months[index];
            final selected =
                month.year == controller.selectedMonth.year &&
                month.month == controller.selectedMonth.month;

            return ListTile(
              title: Text(
                controller.monthLabel(month),
                style: TextStyle(
                  color: selected ? AppColors.accent : AppColors.white,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              trailing: selected
                  ? const Icon(Icons.check, color: AppColors.accent)
                  : null,
              onTap: () {
                controller.selectMonth(month);
                Navigator.pop(sheetContext);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openMonthPicker(context),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bg,
          border: Border.all(width: 1, color: AppColors.cardGreen),
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
          padding: const EdgeInsets.all(6.0),
          child: Row(
            spacing: 5,
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                color: AppColors.white,
                size: 20,
              ),
              Consumer<GraphicController>(
                builder: (context, controller, _) => Text(
                  controller.monthName,
                  style: const TextStyle(color: AppColors.white),
                ),
              ),
              const Icon(
                Icons.arrow_downward_rounded,
                color: AppColors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
