import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/reports_data.dart';

class StatCard extends StatelessWidget {
  final StatItem item;

  const StatCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final bgColor = item.iconBgColor;
    final iconColor = item.iconColor;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _IconWidget(type: item.iconType, color: iconColor),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            item.label,
            style: AppTextStyles.medium14.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          Text(item.value, style: AppTextStyles.bold20),
        ],
      ),
    );
  }
}

class _IconWidget extends StatelessWidget {
  final IconType type;
  final Color color;

  const _IconWidget({required this.type, required this.color});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (type) {
      case IconType.clock:
        icon = Icons.schedule_outlined;
      case IconType.checkCircle:
        icon = Icons.check_circle_outline;
      case IconType.trendingUp:
        icon = Icons.trending_up;
      case IconType.users:
        icon = Icons.people_outline;
      case IconType.diploma:
        icon = Icons.workspace_premium_outlined;
      case IconType.course:
        icon = Icons.menu_book_outlined;
      case IconType.notification:
        icon = Icons.notifications_outlined;
      case IconType.booking:
        icon = Icons.event_available_outlined;
      case IconType.edit:
        icon = Icons.edit_outlined;
    }
    return Icon(icon, size: 20, color: color);
  }
}
