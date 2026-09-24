import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/features/home/pages/home_page.dart';
import 'package:sem_sufoco/features/login/page/login_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/homepage',

  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginPage();
      },
    ),

    GoRoute(
      path: '/homepage',
      builder: (context, state) {
        return const HomePage();
      },
    ),
  ],
);
