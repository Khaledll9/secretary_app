import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/reports_data.dart';

class StatCoursesCard extends StatelessWidget {
  final StatItem item;

  const StatCoursesCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final bgColor = item.iconBgColor;
    final iconColor = item.iconColor;

    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                item.iconType == IconType.diploma
                    ? Icons.workspace_premium_outlined
                    : Icons.menu_book_outlined,
                size: 18,
                color: iconColor,
              ),
            ),
          ),
          const Spacer(),
          Text(item.label, style: AppTextStyles.medium14),
          Text(item.value, style: AppTextStyles.bold20),
        ],
      ),
    );
  }
}
