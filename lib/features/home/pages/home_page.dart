import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/core/theme/text_style.dart';
import 'package:sem_sufoco/features/home/widgets/app_bar_custom.dart';
import 'package:sem_sufoco/features/home/widgets/app_extract.dart';
import 'package:sem_sufoco/features/home/widgets/app_icon_app_bar.dart';
import 'package:sem_sufoco/features/home/widgets/app_title_app_bar.dart';
import 'package:sem_sufoco/features/home/widgets/card_category_setion.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = 'Rafael';
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBarCustom(userName: userName),
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.bg,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shodownBox,
                        blurRadius: 4, // O desfoque da sombra
                        // O quanto a sombra se espalha
                      ),
                    ],
                  ),
                ),

                const Text('Categorias', style: AppTextStyle.subTitle),

                const SizedBox(height: 100, child: CardCategorySetion()),

                const AppExtract(),

                // SizedBox(
                //   height: 100,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.symmetric(vertical: 4),
                //         child: Container(
                //           width: 110,
                //           decoration: BoxDecoration(
                //             color: AppColors.bg,
                //             borderRadius: BorderRadius.circular(10),
                //             boxShadow: const [
                //               BoxShadow(
                //                 color: AppColors.shodownBox,
                //                 blurRadius: 4,
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
