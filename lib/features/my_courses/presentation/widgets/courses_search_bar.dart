import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class CoursesSearchBar extends StatelessWidget {
  const CoursesSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.surfaceContainerHighest),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Theme.of(context).colorScheme.outlineVariant, size: 20),
          const SizedBox(width: 8),
          Text(
            'ابحث عن دورة أو دبلوم...',
            style: AppTextStyles.regular14.copyWith(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
        ],
      ),
    );
  }
}
