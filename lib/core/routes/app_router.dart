import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/features/home/pages/categories_page.dart';
import 'package:sem_sufoco/features/login/page/login_page.dart';
import 'package:sem_sufoco/features/home/pages/gastos_categoria.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/login',

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
      }
    ),
   GoRoute(
      path: '/GastosCategoria',
      builder: (context, state) {
        return const GastosCategoria();
      },
    ),
  ],
);
