import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/view_all_widget.dart';
import '../../domain/entities/reports_data.dart';

class ActivityLogSection extends StatelessWidget {
  final String title;
  final List<ActivityItem> items;
  final VoidCallback? onViewAll;

  const ActivityLogSection({
    super.key,
    required this.title,
    required this.items,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppTextStyles.bold18),
                InkWell(onTap: onViewAll, child: ViewAllWidget()),
              ],
            ),
          ),
          const SizedBox(height: 16),
            ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _ActivityItemTile(item: item),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityItemTile extends StatelessWidget {
  final ActivityItem item;

  const _ActivityItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(item.iconBgColor),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(child: _activityIcon(context, item.iconType)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.text,
                style: AppTextStyles.medium14.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item.timestamp,
                style: AppTextStyles.regular12.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _activityIcon(BuildContext context, IconType type) {
    IconData icon;
    switch (type) {
      case IconType.notification:
        icon = Icons.notifications_outlined;
      case IconType.booking:
        icon = Icons.event_available;
      case IconType.edit:
        icon = Icons.edit_outlined;
      default:
        icon = Icons.circle;
    }
    return Icon(icon, size: 20, color: Theme.of(context).colorScheme.outline);
  }
}
