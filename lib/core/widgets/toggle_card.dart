import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class ToggleRowItem {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleRowItem({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });
}

class ToggleCard extends StatelessWidget {
  final List<ToggleRowItem> items;

  const ToggleCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length * 2 - 1, (index) {
          if (index.isOdd) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Divider(
                height: 1,
                color: theme.colorScheme.surfaceContainerLowest,
              ),
            );
          }
          final item = items[index ~/ 2];
          return _ToggleRowItem(item: item);
        }),
      ),
    );
  }
}

class _ToggleRowItem extends StatelessWidget {
  final ToggleRowItem item;

  const _ToggleRowItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, style: AppTextStyles.medium16),
            const SizedBox(height: 2),
            Text(item.subtitle, style: AppTextStyles.regular12),
          ],
        ),
        Switch.adaptive(
          value: item.value,
          onChanged: item.onChanged,
          activeTrackColor: theme.colorScheme.primary,
          trackOutlineColor: WidgetStateProperty.all(
            theme.colorScheme.surface,
          ),
          inactiveThumbColor: theme.colorScheme.surface,
          inactiveTrackColor: theme.colorScheme.surfaceContainer,
        ),
      ],
    );
  }
}
