import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';

class AppTitleAppBar extends StatelessWidget {
  const AppTitleAppBar({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Olá $userName 🖐️ ', style: AppTextStyle.AppBartitle),
          const Text(
            'Vamos conquistar seus objetivos',
            style: AppTextStyle.AppBarsubTitle,
          ),
        ],
      ),
    );
  }
}
