import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouterHelper;
import 'package:secretary_app/features/booking/domain/entities/booking_entity.dart';

import '../../../../../core/utils/app_routes.dart';
import 'booking_action_card_row.dart';
import 'booking_card_top_row.dart';
import 'booking_session_card_info.dart';

class BookingCard extends StatelessWidget {
  final BookingEntity booking;

  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRoutes.bookingDetails,
          pathParameters: {'id': booking.id},
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BookingCardTopRow(booking: booking),
              BookingSessionCardInfo(booking: booking),
              BookingActionCardRow(booking: booking),
            ],
          ),
        ),
      ),
    );
  }
}
