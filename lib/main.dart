import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sem_sufoco/core/routes/app_router.dart';
import 'package:sem_sufoco/features/home/controllers/GraphicController.dart';
import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';
import 'package:sem_sufoco/features/categorie/controller/category_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://codkqbpcgpafyrjgkvjh.supabase.co',
    publishableKey: 'sb_publishable_JJYwmwGeT2ad6YMHEM-OPw__2riqxqQ',
  );

  runApp(
    MultiProvider(
      providers: [
        // =========================
        // Transações
        // =========================
        ChangeNotifierProvider(create: (_) => TransactionController()),

        // =========================
        // Categorias
        // =========================
        ChangeNotifierProvider(
          create: (_) => CategoryController()..loadCategories(),
        ),

        // =========================
        // Gráficos
        // =========================
        ChangeNotifierProxyProvider<TransactionController, GraphicController>(
          create: (_) => GraphicController(transactions: []),
          update: (_, transactionController, graphicController) {
            graphicController!.updateTransactions(
              transactionController.transactions,
            );

            return graphicController;
          },
        ),
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
