import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/home/widgets/app_extract.dart';
import 'package:sem_sufoco/features/home/widgets/app_line.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
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
                      ),
                    ],
                  ),
                ),

                AppExtract(),

                Text('Gastos', style: AppTextStyle.subTitle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
