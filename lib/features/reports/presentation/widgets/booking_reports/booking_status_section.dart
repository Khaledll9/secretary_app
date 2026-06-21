import 'package:flutter/material.dart';

import '../../../../../../core/theme/text_styles.dart';
import '../../../domain/entities/reports_data.dart';

class BookingStatusSection extends StatelessWidget {
  final List<StatusDistribution> items;

  const BookingStatusSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('نسبة الحجوزات حسب الحالة', style: AppTextStyles.bold16),
            const SizedBox(height: 16),
            ...items.map((item) => _StatusBar(item: item)),
          ],
        ),
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  final StatusDistribution item;

  const _StatusBar({required this.item});

  @override
  Widget build(BuildContext context) {
    final color = Color(item.color);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                item.label,
                style: AppTextStyles.bold12.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${item.percent}%',
                style: AppTextStyles.bold12.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(9999),
            child: SizedBox(
              width: double.infinity,
              height: 8,
              child: Stack(
                children: [
                  Container(color: Theme.of(context).colorScheme.surfaceContainerHighest),
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: item.percent / 100,
                    child: Container(color: color),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
