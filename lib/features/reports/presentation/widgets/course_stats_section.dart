import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/view_all_widget.dart';
import '../../domain/entities/reports_data.dart';
import 'stat_courses_card.dart';

class CourseStatsSection extends StatelessWidget {
  final String title;
  final List<StatItem> items;
  final VoidCallback? onViewAll;

  const CourseStatsSection({
    super.key,
    required this.title,
    required this.items,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Row(
          children: [
            Expanded(child: StatCoursesCard(item: items[0])),
            const SizedBox(width: 16),
            Expanded(child: StatCoursesCard(item: items[1])),
          ],
        ),
      ],
    );
  }
}
