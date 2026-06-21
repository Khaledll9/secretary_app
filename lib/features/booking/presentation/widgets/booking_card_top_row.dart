import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/booking_entity.dart';

class BookingCardTopRow extends StatelessWidget {
  final BookingEntity booking;

  const BookingCardTopRow({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final (
      Color badgeBg,
      Color badgeColor,
      String badgeLabel,
    ) = switch (booking.status) {
      BookingStatus.pending => (
        Theme.of(context).colorScheme.surfaceBright,
        Theme.of(context).colorScheme.surfaceDim,
        'بانتظار التأكيد',
      ),
      BookingStatus.confirmed => (
        Theme.of(context).colorScheme.tertiaryContainer,
        Theme.of(context).colorScheme.tertiary,
        'مؤكدة',
      ),
      BookingStatus.cancelled => (
        Theme.of(context).colorScheme.errorContainer,
        Theme.of(context).colorScheme.error,
        'ملغية',
      ),
      BookingStatus.completed => (
        Theme.of(context).colorScheme.primaryContainer,
        Theme.of(context).colorScheme.primary,
        'مكتملة',
      ),
    };

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('احمد محمد', style: AppTextStyles.bold14),
            const SizedBox(height: 2),
            Text(
              booking.courseCode,
              style: AppTextStyles.bold12.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: badgeBg,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            badgeLabel,
            style: AppTextStyles.bold12.copyWith(color: badgeColor),
          ),
        ),
      ],
    );
  }
}
