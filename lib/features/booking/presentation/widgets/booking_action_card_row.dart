import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/primary_bottom.dart';
import '../../domain/entities/booking_entity.dart';

class BookingActionCardRow extends StatelessWidget {
  final BookingEntity booking;

  const BookingActionCardRow({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryBottom(
            hasIcon: false,
            elevation: 1,
            title: 'تأكيد الحجز',
            icon: Icons.check,
            onTap: () {
              context.pushNamed(
                AppRoutes.confirmAttendance,
                pathParameters: {'id': booking.id},
              );
            },
            height: 48,
            textStyle: AppTextStyles.bold14.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.close, color: Theme.of(context).colorScheme.error),
          constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: Theme.of(context).colorScheme.error),
            ),
          ),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
