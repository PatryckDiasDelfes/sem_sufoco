import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      // TEMP: shortcut to preview the add transaction page. Remove later.
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push('/transactions/new'),
          child: const Text('Abrir Adicionar Gasto'),
        ),
      ),
    );
  }
}
