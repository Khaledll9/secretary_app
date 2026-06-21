import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import '../../domain/entities/booking_entity.dart';

class BookingStatusBadge extends StatelessWidget {
  final BookingStatus status;

  const BookingStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final (Color bg, Color textColor, String label) = switch (status) {
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: AppTextStyles.bold12.copyWith(color: textColor),
      ),
    );
  }
}
