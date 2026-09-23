import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 100, width: 100, color: AppColors.black),
          ],
        ),
      ),
    );
  }
}
