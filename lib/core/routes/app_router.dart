import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/features/login/page/login_page.dart';
import 'package:sem_sufoco/features/release_details/page/release_details_page.dart';
import 'package:sem_sufoco/features/transaction/page/transaction_page.dart';

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
      path: '/ReleaseDetailsPage',
      builder: (context, state) {
        return const ReleaseDetailsPage();
      },
    ),

    GoRoute(
      path: '/TransactionPage',
      builder: (context, state) {
        return const TransactionPage();
      },
    ),
  ],
);
