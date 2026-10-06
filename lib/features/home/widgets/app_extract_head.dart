import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'package:flutter/material.dart';

import 'package:sem_sufoco/core/theme/app_colors.dart';

import 'package:sem_sufoco/core/theme/text_style.dart';

import 'package:sem_sufoco/features/home/widgets/app_icon_stack_up_graphic.dart';

class AppExtractHead extends StatelessWidget {
  const AppExtractHead({
    super.key,
    required this.pageController,
    required this.controller,
  });

  final PageController pageController;

  final NotchBottomBarController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16, bottom: 4),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: AppIconStackUpGraphic(),
          ),
          const Text('Movimentações', style: AppTextStyle.homeText),
          const Spacer(flex: 1),
          GestureDetector(
            child: const Row(
              children: [
                Text('Adicionar', style: AppTextStyle.homeTextGren),
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.add_circle,
                    color: AppColors.grenLive,
                    size: 15,
                  ),
                ),
              ],
            ),
            onTap: () {
              if (pageController.hasClients) {
                pageController.jumpToPage(0);
              }

              controller.jumpTo(0);
            },
          ),
        ],
      ),
    );
  }
}
