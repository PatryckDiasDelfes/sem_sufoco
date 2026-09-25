import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/features/login/page/login_page.dart';
import 'package:sem_sufoco/features/settings/page/settings_page.dart';

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
      path: '/settings',
      builder: (context, state) {
        return const SettingsPage();
      },
    ),
  ],
);
