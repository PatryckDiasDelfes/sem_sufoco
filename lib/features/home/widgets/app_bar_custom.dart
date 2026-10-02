import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/home/widgets/app_icon_app_bar.dart';
import 'package:sem_sufoco/features/home/widgets/app_title_app_bar.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backGround,
      title: AppTitleAppBar(userName: userName),
      automaticallyImplyLeading: false,
      centerTitle: false,
      actions: [
        AppIconAppBar(
          numPadding: 20,
          icon: IconButton(
            onPressed: () {
              context.push('/SettingsPage');
            },
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(20, 60);
}
