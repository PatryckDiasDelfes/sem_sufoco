import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';
import 'package:sem_sufoco/features/settings/widgets/profile_card.dart';
import 'package:sem_sufoco/features/settings/widgets/settings_section.dart';
import 'package:sem_sufoco/features/settings/widgets/settings_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  bool _darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColors.darkBackground,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leadingWidth: 78,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: SizedBox(
              width: 38,
              height: 38,
              child: IconButton(
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.darkSurface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(
                  Icons.chevron_left_rounded,
                  color: AppColors.textPrimary,
                ),
                onPressed: () {
                  if (context.canPop()) context.pop();
                },
              ),
            ),
          ),
        ),
        title: const Text(
          'Configurações',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        children: [
          ProfileCard(
            name: 'Samuel Cabral',
            email: 'qualquercoisablumenau@gmail.com',
            onTap: () {},
          ),
          const SizedBox(height: 28),

          SettingsSection(
            title: 'Conta',
            children: [
              SettingsTile(
                icon: Icons.person_outline_rounded,
                iconColor: AppColors.accent,
                label: 'Editar perfil',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.verified_user_outlined,
                iconColor: AppColors.blue,
                label: 'Segurança e login',
                onTap: () {},
              ),
              SettingsTile.toggle(
                icon: Icons.notifications_none_rounded,
                iconColor: AppColors.yellow,
                label: 'Notificações',
                switchValue: _notifications,
                onChanged: (v) => setState(() => _notifications = v),
              ),
            ],
          ),
          const SizedBox(height: 28),

          SettingsSection(
            title: 'Preferências',
            children: [
              SettingsTile(
                icon: Icons.attach_money_rounded,
                iconColor: AppColors.accent,
                label: 'Moeda padrão',
                value: r'R$ · BRL',
                onTap: () {},
              ),
              SettingsTile.toggle(
                icon: Icons.dark_mode_outlined,
                iconColor: AppColors.purple,
                label: 'Modo escuro',
                switchValue: _darkMode,
                onChanged: (v) => setState(() => _darkMode = v),
              ),
              SettingsTile(
                icon: Icons.language_rounded,
                iconColor: AppColors.blue,
                label: 'Idioma',
                value: 'Português',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 28),

          SettingsSection(
            title: 'Suporte',
            children: [
              SettingsTile(
                icon: Icons.help_outline_rounded,
                iconColor: AppColors.accent,
                label: 'Central de ajuda',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.chat_bubble_outline_rounded,
                iconColor: AppColors.blue,
                label: 'Fale conosco',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.star_outline_rounded,
                iconColor: AppColors.yellow,
                label: 'Avaliar o app',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 22),

          SizedBox(
            height: 48,
            child: TextButton.icon(
              onPressed: () => context.go('/login'),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.danger.withValues(alpha: 0.08),
                foregroundColor: AppColors.danger,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              icon: const Icon(Icons.logout_rounded, size: 18),
              label: const Text('Sair da conta'),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
