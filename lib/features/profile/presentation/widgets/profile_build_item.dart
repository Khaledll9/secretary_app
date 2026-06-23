import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import 'profile_menu_section.dart';

class ProfileBuildItem extends StatelessWidget {
  final MenuItem item;
  const ProfileBuildItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final bgColor = item.type == MenuItemType.logout
        ? Theme.of(context).colorScheme.errorContainer
        : Theme.of(context).colorScheme.surfaceContainer;
    final iconColor = item.type == MenuItemType.logout
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: double.infinity,
        height: 64,
        child: ElevatedButton(
          onPressed: item.onTap,
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  item.icon,
                  size: 20,
                  color: item.type == MenuItemType.logout
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.title,
                  style: AppTextStyles.regular16.copyWith(
                    color: item.type == MenuItemType.logout
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              if (item.type == MenuItemType.darkMode)
                Switch.adaptive(
                  value: false,
                  onChanged: (_) => item.onTap?.call(),
                  activeTrackColor: Theme.of(context).colorScheme.primary,
                  trackOutlineColor: WidgetStateProperty.all(Theme.of(context).colorScheme.surface),
                  inactiveThumbColor: Theme.of(context).colorScheme.surface,
                  inactiveTrackColor: Theme.of(context).colorScheme.surfaceContainer,
                )
              else
                Icon(Icons.arrow_forward_ios, size: 18, color: iconColor),
            ],
          ),
        ),
      ),
    );
  }
}
