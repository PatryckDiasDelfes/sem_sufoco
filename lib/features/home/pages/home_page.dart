import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/categorie/controller/category_controller.dart';
import 'package:sem_sufoco/features/home/widgets/Graphic/app_graphic_setion.dart';
import 'package:sem_sufoco/features/home/widgets/app_bar_custom.dart';
import 'package:sem_sufoco/features/home/widgets/app_extract.dart';
import 'package:sem_sufoco/features/categorie/widget/card_category_setion.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.pageController,
    required this.controller,
    super.key,
  });

  final PageController pageController;
  final NotchBottomBarController controller;

  @override
  Widget build(BuildContext context) {
    const userName = 'Vitor';

    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBarCustom(userName: userName),
      extendBodyBehindAppBar: false,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppGraphicSetion(),

                const Text('Categorias', style: AppTextStyle.subTitle),

                Consumer<CategoryController>(
                  builder: (context, categoryController, child) {
                    if (categoryController.isLoading &&
                        categoryController.categories.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (categoryController.errorMessage != null &&
                        categoryController.categories.isEmpty) {
                      return Text(
                        categoryController.errorMessage!,
                        style: const TextStyle(color: Colors.white),
                      );
                    }

                    return CardCategorySetion(
                      categories: categoryController.categories,
                      limit: 5,
                    );
                  },
                ),

                AppExtract(
                  pageController: pageController,
                  controller: controller,
                  limit: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
