import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class DailySummarySection extends StatelessWidget {
  const DailySummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ملخص اليوم',
            style: AppTextStyles.bold14.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'حجوزات مؤكدة',
                style: AppTextStyles.bold12.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Text('42 / 50', style: AppTextStyles.bold14),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 42 / 50,
            backgroundColor: Theme.of(context).colorScheme.surface,
            color: Theme.of(context).colorScheme.primary,
            minHeight: 6,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '12',
                    style: AppTextStyles.bold18.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text('إعلان', style: AppTextStyles.medium16),
                ],
              ),
              Column(
                children: [
                  Text(
                    '80,000 ريال',
                    style: AppTextStyles.bold18.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text('إيرادات اليوم', style: AppTextStyles.medium16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
