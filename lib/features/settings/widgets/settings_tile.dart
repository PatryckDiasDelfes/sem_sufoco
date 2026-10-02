import 'package:flutter/material.dart';
import 'package:sem_sufoco/core/theme/app_colors.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    this.value,
    this.onTap,
  }) : switchValue = null,
       onChanged = null;

  const SettingsTile.toggle({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required bool this.switchValue,
    required this.onChanged,
  }) : value = null,
       onTap = null;

  final IconData icon;
  final Color iconColor;
  final String label;
  final String? value;
  final VoidCallback? onTap;
  final bool? switchValue;
  final ValueChanged<bool>? onChanged;

  bool get _isToggle => switchValue != null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _isToggle ? () => onChanged?.call(!switchValue!) : onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (_isToggle)
              Switch(
                value: switchValue!,
                onChanged: onChanged,
                activeThumbColor: AppColors.white,
                activeTrackColor: AppColors.accent,
                inactiveThumbColor: AppColors.white,
                inactiveTrackColor: AppColors.chevron,
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              )
            else ...[
              if (value != null)
                Text(
                  value!,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 13,
                  ),
                ),
              const SizedBox(width: 4),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.chevron,
                size: 20,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
