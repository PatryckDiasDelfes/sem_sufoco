import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sem_sufoco/features/categorie/page/categories_page.dart';
import 'package:sem_sufoco/features/home/pages/home_page.dart';
import 'package:sem_sufoco/features/transaction/page/transaction_page.dart';
import 'package:sem_sufoco/shared/widget/app_navigator_bar.dart';

class HomePageSetion extends StatefulWidget {
  const HomePageSetion({super.key});

  @override
  State<HomePageSetion> createState() => _HomePageSetion();
}

class _HomePageSetion extends State<HomePageSetion> {
  final PageController _pageController = PageController(initialPage: 1);
  final NotchBottomBarController controller = NotchBottomBarController(
    index: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),

        controller: _pageController,

        children: [
          TransactionPage(
            controller: controller,
            pageController: _pageController,
          ),
          HomePage(controller: controller, pageController: _pageController),
          CategoriesPage(),
        ],
      ),

      bottomNavigationBar: AppNavigatorBar(
        pageController: _pageController,
        controller: controller,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
