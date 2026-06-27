import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../booking/domain/entities/booking_entity.dart';
import '../../../booking/presentation/widgets/booking_card.dart';

final List<BookingEntity> _mockBookings = [
  BookingEntity(
    id: '1',
    status: BookingStatus.pending,
    courseName: 'دورة اللغة العربية',
    courseCode: 'YSR-782',
    sessionInfo: 'تدريب إلكتروني - أونلاين',
    date: 'قبل 2 يوم',
    time: 'الساعة 3:00 م',
    price: 3000,
  ),
  BookingEntity(
    id: '2',
    status: BookingStatus.confirmed,
    courseName: 'دورة المحادثة باللغة الإنجليزية',
    courseCode: 'YSR-782',
    sessionInfo: 'تدريب حضوري - قاعة 3',
    date: '20 Oct',
    time: 'الساعة 10:00 ص',
    price: 5000,
  ),
  BookingEntity(
    id: '3',
    status: BookingStatus.cancelled,
    courseName: 'دورة مهارات التواصل',
    courseCode: 'YSR-782',
    sessionInfo: 'تدريب عن بعد',
    date: '15 Oct',
    time: 'الساعة 2:00 م',
    price: 2500,
  ),
];

class BookingRequestsSection extends StatelessWidget {
  const BookingRequestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_month,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8.0),
            Text('طلبات الحجز الجديدة', style: AppTextStyles.bold16),
            const SizedBox(width: 8.0),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Text(
                '5',
                style: AppTextStyles.bold12.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              BookingCard(booking: _mockBookings[0]),
              BookingCard(booking: _mockBookings[1]),
            ],
          ),
        ),
      ],
    );
  }
}
