import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/routes/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sem sufoco',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF000000)),
      ),
      routerConfig: appRouter,
    );
  }
}
