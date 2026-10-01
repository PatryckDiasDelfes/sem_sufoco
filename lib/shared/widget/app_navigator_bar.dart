import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class AppNavigatorBar extends StatefulWidget {
  const AppNavigatorBar({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<AppNavigatorBar> createState() => _AppNavigatorBarState();
}

class _AppNavigatorBarState extends State<AppNavigatorBar> {
  final NotchBottomBarController controller = NotchBottomBarController(
    index: 1,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      showShadow: true,
      shadowElevation: 5,

      showTopRadius: true,
      showBottomRadius: false,

      kIconSize: 25,
      kBottomRadius: 20,

      color: AppColors.bg,
      notchColor: AppColors.cardGreen,
      itemLabelStyle: const TextStyle(color: AppColors.white),

      durationInMilliSeconds: 300,

      notchBottomBarController: controller,

      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(Icons.add_circle_outline, color: Colors.white),
          activeItem: Icon(Icons.add_circle_outline, color: Colors.white),
          itemLabel: 'Adicionar',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.home_outlined, color: AppColors.white),
          activeItem: Icon(Icons.home_outlined, color: Colors.white),
          itemLabel: 'Home',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.category_outlined, color: AppColors.white),
          activeItem: Icon(Icons.category_outlined, color: Colors.white),
          itemLabel: 'Categorias',
        ),
      ],
      onTap: (index) {
        widget.pageController.jumpToPage(index);
      },
    );
  }
}
