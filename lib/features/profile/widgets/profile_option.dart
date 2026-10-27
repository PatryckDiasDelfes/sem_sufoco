import 'package:flutter/material.dart';

class ProfileOption {
  const ProfileOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
}
