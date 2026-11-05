import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sem_sufoco/features/home/controllers/graphic_controller.dart';
import 'package:sem_sufoco/features/release_details/controller/release_details_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:sem_sufoco/core/service/secure_auth_storage.dart';
import 'package:sem_sufoco/core/routes/app_router.dart';

import 'package:sem_sufoco/features/transaction/controller/transaction_controller.dart';
import 'package:sem_sufoco/features/categorie/controller/category_controller.dart';

// =========================
// InicializaÃ§Ã£o
// =========================

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://codkqbpcgpafyrjgkvjh.supabase.co',
    publishableKey: 'sb_publishable_JJYwmwGeT2ad6YMHEM-OPw__2riqxqQ',

    // Armazenamento seguro da sessÃ£o.
    authOptions: FlutterAuthClientOptions(localStorage: SecureAuthStorage()),
  );

  // =========================
  // VerificaÃ§Ã£o da SessÃ£o
  // =========================

  final session = Supabase.instance.client.auth.currentSession;

  debugPrint('SessÃ£o encontrada: ${session != null}');
  debugPrint('UsuÃ¡rio: ${session?.user.email}');

  // =========================
  // InicializaÃ§Ã£o do Aplicativo
  // =========================

  runApp(
    MultiProvider(
      providers: [
        // =========================
        // TransaÃ§Ãµes
        // =========================
        ChangeNotifierProvider(
          create: (_) => TransactionController()..loadTransactions(),
        ),

        // =========================
        // Categorias
        // =========================
        ChangeNotifierProvider(
          create: (_) => CategoryController()..loadCategories(),
        ),

        // =========================
        // GrÃ¡ficos
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

        ChangeNotifierProvider(create: (_) => ReleaseDetailsController()),
      ],
      child: const MainApp(),
    ),
  );
}

// =========================
// Aplicativo Principal
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
      routerConfig: appRouter,
    );
  }
}

