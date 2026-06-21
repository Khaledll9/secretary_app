import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/booking_entity.dart';

class BookingSessionCardInfo extends StatelessWidget {
  final BookingEntity booking;

  const BookingSessionCardInfo({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Text(booking.courseName, style: AppTextStyles.bold16),
          const SizedBox(height: 8),
          Divider(color: Theme.of(context).colorScheme.surfaceContainer),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'المدفوع:',
                style: AppTextStyles.bold14.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textDirection: TextDirection.rtl,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${booking.price.toStringAsFixed(0)} ر.ي',
                  style: AppTextStyles.bold14.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
