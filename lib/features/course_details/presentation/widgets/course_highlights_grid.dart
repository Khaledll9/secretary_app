import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class CourseHighlightsGrid extends StatelessWidget {
  const CourseHighlightsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // السعر
        Expanded(
          child: _CourseHighlightCard(
            title: 'السعر',
            value: '20,000',
            icon: Icons.account_balance_wallet_outlined, // Replace with exact SVG/Icon
          ),
        ),
        const SizedBox(width: 10),
        // المدة
        Expanded(
          child: _CourseHighlightCard(
            title: 'المدة',
            value: '4 أسابيع',
            icon: Icons.access_time_rounded, // Replace with exact SVG/Icon
          ),
        ),
        const SizedBox(width: 10),
        // الشهادة
        Expanded(
          child: _CourseHighlightCard(
            title: 'الشهادة',
            value: 'معتمدة',
            icon: Icons.verified_outlined, // Replace with exact SVG/Icon
          ),
        ),
      ],
    );
  }
}

class _CourseHighlightCard extends StatelessWidget {
  const _CourseHighlightCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppTextStyles.regular12,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: AppTextStyles.bold14,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
