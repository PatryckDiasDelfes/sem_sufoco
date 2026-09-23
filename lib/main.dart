import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/features/home/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

// =========================
// ROTAS
// =========================

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const MainPage();
      },
    ),

    GoRoute(
      path: '/segunda',
      builder: (context, state) {
        return const HomePage();
      },
    ),
  ],
);

// =========================
// APP
// =========================

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sem Sufoco',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF000000)),
      ),
      routerConfig: router,
    );
  }
}

// =========================
// MAIN PAGE
// =========================

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sem Sufoco')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bem-vindo ao Sem Sufoco!'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.go('/segunda');
              },
              child: const Text('Ir para Home'),
            ),
          ],
        ),
      ),
    );
  }
}
