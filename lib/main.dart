import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/routes/app_router.dart';
import 'package:sem_sufoco/features/home/controllers/GraphicController.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionController()),
        ChangeNotifierProvider(create: (_) => GraphicController()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sem Sufoco',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF000000)),
      ),

      routerConfig: appRouter,
    );
  }
}
