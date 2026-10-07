import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/home/widgets/app_spend.dart';

class AppCategoryExtrect extends StatelessWidget {
  const AppCategoryExtrect({
    super.key,
    required this.category,
    required this.transaction,
  });

  final Category category;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.bg,
            border: Border.all(color: AppColors.accent),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: AppColors.shodownBox, blurRadius: 4),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              context.push('/ReleaseDetailsPage', extra: transaction);
            },
            child: AppSpend(
              name: transaction.establishment,
              category: category.name,
              price: transaction.amount,

              date:
                  '${transaction.purchasedAt.day} de '
                  '${transaction.purchasedAt.month}',

              // Ícone sempre preto
              icone: Icon(category.icon, color: AppColors.accent),

              // Somente o valor muda de cor
              priceColor: transaction.type == TransactionType.income
                  ? AppColors.grenLive
                  : AppColors.danger,
              type: transaction.type,
            ),
          ),
        ),
      ),
    );
  }
}
