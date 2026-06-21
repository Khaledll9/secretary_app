import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class CoursesSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;

  const CoursesSectionHeader({
    super.key,
    required this.title,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.bold18),
        if (onViewAll != null)
          TextButton(
            onPressed: onViewAll,
            child: Text(
              'عرض الكل',
              style: AppTextStyles.medium14.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
      ],
    );
  }
}
