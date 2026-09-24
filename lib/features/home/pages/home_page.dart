import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  // width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shodownBox,
                        blurRadius: 8, // O desfoque da sombra
                        spreadRadius: 2, // O quanto a sombra se espalha
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shodownBox,
                        blurRadius: 8, // O desfoque da sombra
                        spreadRadius: 2, // O quanto a sombra se espalha
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    spacing: 10,
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: AppColors.black),
                        child: const Row(
                          children: [
                            Icon(Icons.insert_chart, color: AppColors.white),
                            const Text(
                              'Movimentações recentes',
                              style: AppTextStyle.subTitle,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),

                Text('Gastos', style: AppTextStyle.subTitle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
