import 'package:flutter/material.dart';
import 'package:sem_sufoco/features/profile/widgets/continue_button.dart';
import 'package:sem_sufoco/features/profile/widgets/option_card.dart';
import 'package:sem_sufoco/features/profile/widgets/profile_option.dart';

const profileOptions = [
  ProfileOption(
    title: 'Personal',
    subtitle: 'Placeholder subtitle',
    icon: Icons.person_outline,
    accent: Color(0xFF1FE0A8),
  ),
  ProfileOption(
    title: 'Team',
    subtitle: 'Placeholder subtitle',
    icon: Icons.group_outlined,
    accent: Color(0xFF5B93F5),
  ),
];

class ProfileTypeScreen extends StatefulWidget {
  const ProfileTypeScreen({super.key});

  @override
  State<ProfileTypeScreen> createState() => _ProfileTypeScreenState();
}

class _ProfileTypeScreenState extends State<ProfileTypeScreen> {
  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060B0A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: profileOptions.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final option = profileOptions[index];
                    return OptionCard(
                      title: option.title,
                      subtitle: option.subtitle,
                      icon: option.icon,
                      accent: option.accent,
                      selected: index == selectedIndex,
                      onTap: () => onTap(index),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              ContinueButton(
                onTap: () {
                  debugPrint('Chosen: ${profileOptions[selectedIndex].title}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
