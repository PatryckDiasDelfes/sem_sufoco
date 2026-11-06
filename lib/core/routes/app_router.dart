import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/model/category.dart';
import 'package:sem_sufoco/core/model/transaction.dart';
import 'package:sem_sufoco/features/ExtractPage/page/extract_page.dart';
import 'package:sem_sufoco/features/categorie/page/Category_Extract_page.dart';
import 'package:sem_sufoco/features/categorie/page/categories_page.dart';
import 'package:sem_sufoco/features/home/pages/home_page.dart';
import 'package:sem_sufoco/features/home/pages/home_page_setion.dart';
import 'package:sem_sufoco/features/login/page/login_page.dart';
import 'package:sem_sufoco/features/release_details/page/release_details_page.dart';
import 'package:sem_sufoco/features/settings/pages/settings_page.dart';
import 'package:sem_sufoco/features/register/controller/register_controller.dart';
import 'package:sem_sufoco/features/register/page/register_page.dart';
import 'package:sem_sufoco/features/transaction/page/transaction_page.dart';
import 'package:sem_sufoco/shared/splash/page/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    // =========================
    // Splash
    // =========================
    GoRoute(
      path: '/splash',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),

    // =========================
    // Login
    // =========================
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginPage();
      },
    ),

    // =========================
    // Cadastro
    // =========================
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => RegisterController(),
          child: const RegisterPage(),
        );
      },
    ),

    // =========================
    // Detalhes do Lançamento
    // =========================
    GoRoute(
      path: '/ReleaseDetailsPage',
      builder: (context, state) {
        final transaction = state.extra;

        if (transaction is! Transaction) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text(
                'Transação não encontrada.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        return ReleaseDetailsPage(transaction: transaction);
      },
    ),

    // =========================
    // Home
    // =========================
    GoRoute(
      path: '/HomePage',
      builder: (context, state) {
        return HomePage(
          pageController: PageController(),
          controller: NotchBottomBarController(),
        );
      },
    ),

    // =========================
    // Categorias
    // =========================
    GoRoute(
      path: '/CategoriesPage',
      builder: (context, state) {
        return const CategoriesPage();
      },
    ),

    // =========================
    // Extrato da Categoria
    // =========================
    GoRoute(
      path: '/CategoryExtractPage',
      builder: (context, state) {
        final category = state.extra;

        if (category is! Category) {
          return const CategoriesPage();
        }

        return CategoryExtractPage(category: category);
      },
    ),

    // =========================
    // Configurações
    // =========================
    GoRoute(
      path: '/SettingsPage',
      builder: (context, state) {
        return const SettingsPage();
      },
    ),

    // =========================
    // Home Section
    // =========================
    GoRoute(
      path: '/MainHomePage',
      builder: (context, state) {
        return const HomePageSetion();
      },
    ),

    // =========================
    // Extrato
    // =========================
    GoRoute(
      path: '/extract',
      builder: (context, state) {
        return const ExtractPage();
      },
    ),

    // =========================
    // Editar Lançamento
    // =========================
    GoRoute(
      path: '/EditTransactionPage',
      builder: (context, state) {
        final transaction = state.extra;

        if (transaction is! Transaction) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text(
                'Transação não encontrada.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        return TransactionPage(
          pageController: PageController(),
          controller: NotchBottomBarController(),
          transaction: transaction,
        );
      },
    ),
  ],
);
