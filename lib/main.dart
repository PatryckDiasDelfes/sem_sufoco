import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MainApp());
}
//
// =========================
// ROTAS
// =========================

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomePage();
      },
    ),

    GoRoute(
      path: '/segunda',
      builder: (context, state) {
        return const SegundaPage();
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
      title: 'Sem sufoco',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF000000)),
      ),
      routerConfig: router,
    );
  }
}

// =========================
// HOME
// =========================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sem sufoco ola')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bem vindo ao sem sufoco!'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.go('/segunda');
              },
              child: const Text('Ir para segunda página'),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================
// SEGUNDA PÁGINA
// =========================

class SegundaPage extends StatelessWidget {
  const SegundaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda página')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('Voltar'),
        ),
      ),
    );
  }
}
