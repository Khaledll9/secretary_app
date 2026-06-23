import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import '../providers/booking_provider.dart';

class BookingFilterTabs extends ConsumerWidget {
  const BookingFilterTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(
      bookingProvider.select((s) => s.activeFilter),
    );
    final totalCount = ref.watch(
      bookingProvider.select((s) => s.bookings.length),
    );
    final pendingCount = ref.watch(
      bookingProvider.select(
        (s) => s.bookings.where((b) => b.status.name == 'pending').length,
      ),
    );

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _FilterChipData(
              label: 'الكل',
              count: totalCount,
              filter: BookingFilter.all,
              isActive: activeFilter == BookingFilter.all,
            ),
            const SizedBox(width: 7),
            _FilterChipData(
              label: 'بانتظار التأكيد',
              count: pendingCount,
              filter: BookingFilter.awaiting,
              isActive: activeFilter == BookingFilter.awaiting,
            ),
            const SizedBox(width: 7),
            _FilterChipData(
              label: 'مؤكدة',
              filter: BookingFilter.confirmed,
              isActive: activeFilter == BookingFilter.confirmed,
            ),
            const SizedBox(width: 7),

            _FilterChipData(
              label: 'معلقة',
              filter: BookingFilter.pending,
              isActive: activeFilter == BookingFilter.pending,
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChipData extends ConsumerWidget {
  final String label;
  final int? count;
  final BookingFilter filter;
  final bool isActive;

  const _FilterChipData({
    required this.label,
    this.count,
    required this.filter,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = isActive
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.surfaceContainerLowest;
    final textColor = isActive
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.outline;
    final badgeColor = isActive
        ? Theme.of(context).colorScheme.surface.withValues(alpha: 0.2)
        : Theme.of(context).colorScheme.primaryContainer;

    return GestureDetector(
      onTap: () => ref.read(bookingProvider.notifier).setFilter(filter),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: (isActive
                  ? AppTextStyles.medium14.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    )
                  : AppTextStyles.medium14.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    )),
            ),
            const SizedBox(width: 4),
            if (count != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '$count',
                  style: AppTextStyles.bold10.copyWith(color: textColor),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
