import 'package:flutter/material.dart';

import '../../../../../../core/theme/text_styles.dart';
import '../../../domain/entities/reports_data.dart';

class BarChartSection extends StatelessWidget {
  final List<CourseBooking> items;

  const BarChartSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final barColors = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.primary.withAlpha(200),
      Theme.of(context).colorScheme.primary.withAlpha(150),
      Theme.of(context).colorScheme.primaryFixed,
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'إحصائيات الحجوزات الشهرية',
                    style: AppTextStyles.bold16,
                  ),
                  Text(
                    'عدد الحجوزات خلال الأشهر الماضية',
                    style: AppTextStyles.regular12,
                  ),
                ],
              ),
              Row(
                children: [
                  Text('عرض الكل', style: AppTextStyles.bold12),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 12,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          ...items.asMap().entries.map((entry) {
            final i = entry.key;
            final item = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.name,
                        style: AppTextStyles.regular14.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        '${item.count} طالب',
                        style: AppTextStyles.regular14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9999),
                    child: SizedBox(
                      width: double.infinity,
                      height: 12,
                      child: Stack(
                        children: [
                          Container(color: Theme.of(context).colorScheme.surfaceContainerHighest),
                          FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: item.barRatio,
                            child: Container(color: barColors[i]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
