import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/home/widgets/Graphic/app_graphic_setion.dart';
import 'package:sem_sufoco/features/home/widgets/app_bar_custom.dart';
import 'package:sem_sufoco/features/home/widgets/app_extract.dart';
import 'package:sem_sufoco/features/categorie/widget/card_category_setion.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = 'Rafael';
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBarCustom(userName: userName),
      extendBodyBehindAppBar: false,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppGraphicSetion(),

                const Text('Categorias', style: AppTextStyle.subTitle),

                const SizedBox(height: 100, child: CardCategorySetion()),

                const AppExtract(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
