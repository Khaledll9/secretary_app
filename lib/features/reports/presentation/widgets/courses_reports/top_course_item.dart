import 'package:flutter/material.dart';

import '../../../../../../core/theme/text_styles.dart';

class TopCourseItem extends StatelessWidget {
  final String courseName;
  final String studentCount;

  const TopCourseItem({
    super.key,
    required this.courseName,
    required this.studentCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(courseName, style: AppTextStyles.bold14),
                const SizedBox(height: 4),
                Text(studentCount, style: AppTextStyles.regular12),
              ],
            ),
          ),
          _PublishButton(),
        ],
      ),
    );
  }
}

class _PublishButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'نشر الآن',
        style: AppTextStyles.bold12.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
