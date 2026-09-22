import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sem sufoco',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF000000)),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Sem sufoco')),
        body: const Center(child: Text('bem vindo ao sem sufoco!')),
      ),
    );
  }
}
