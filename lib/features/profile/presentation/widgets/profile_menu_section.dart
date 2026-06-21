import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import 'profile_build_item.dart';

enum MenuItemType {
  standard,
  darkMode,
  logout,
}

class MenuItem {
  final String title;
  final IconData icon;
  final MenuItemType type;
  final VoidCallback? onTap;

  const MenuItem({
    required this.title,
    required this.icon,
    this.type = MenuItemType.standard,
    this.onTap,
  });
}

class ProfileMenuSection extends StatelessWidget {
  final String sectionTitle;
  final List<MenuItem> items;

  const ProfileMenuSection({
    super.key,
    required this.sectionTitle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: AppTextStyles.bold14.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 8),
        ...items.map((item) => ProfileBuildItem(item: item)),
      ],
    );
  }

}
