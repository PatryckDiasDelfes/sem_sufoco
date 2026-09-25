import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/features/home/pages/categories_page.dart';
import 'package:sem_sufoco/features/login/page/login_page.dart';
import 'package:sem_sufoco/features/home/pages/gastos_categoria_page.dart';
import 'package:sem_sufoco/core/constants/categories.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: 'login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/categoria',
      builder: (context, state) {
        return const CategoriesPage();
      },
    ),
    GoRoute(
      path: '/gastos',
      builder: (context, state) {
        final extra = state.extra;
        final cat = state.extra as Category? ?? kCategories[0];
        return GastosCategoria(categoria: cat);
      },
    ),
  ],
);