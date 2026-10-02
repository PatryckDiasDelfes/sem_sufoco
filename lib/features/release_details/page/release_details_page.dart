import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/release_details/widgets/app_button_show_category.dart';
import 'package:sem_sufoco/features/release_details/widgets/app_about_transison.dart';
import 'package:sem_sufoco/features/release_details/widgets/app_release_details_icon.dart';

class ReleaseDetailsPage extends StatelessWidget {
  const ReleaseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
        ),
        title: const Text(
          'Compra no débito',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          SizedBox(height: 24),

          //Local do icon do café
          AppReleaseDetailsIcon(),

          SizedBox(height: 24),

          Text(
            'R\$ 7,50',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 8),

          Text(
            'Lucca Cantina E Restaublumenau Bra',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          SizedBox(height: 24),

          AppButtonShowCategory(),

          SizedBox(height: 32),

          AppAboutTransison(),

          SizedBox(height: 32),
        ],
      ),
    );
  }
}
