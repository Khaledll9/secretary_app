import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import '../../../../core/widgets/primary_bottom.dart';
import '../../../../core/widgets/second_bottom.dart';
import '../providers/booking_details_provider.dart';
import '../widgets/booking/info_cards_section.dart';
import '../widgets/booking/payment_breakdown_section.dart';

class BookingDetailsScreen extends ConsumerWidget {
  final String bookingId;

  const BookingDetailsScreen({super.key, required this.bookingId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(bookingDetailsProvider(bookingId).notifier);
    final state = ref.watch(bookingDetailsProvider(bookingId));

    if (state.status == BookingDetailsStatus.idle) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifier.loadDetails();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تفاصيل الحجز',
          style: AppTextStyles.bold18.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.outline,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            Expanded(child: _buildBody(context, state, ref)),
            const SizedBox(height: 24),
            PrimaryBottom(
              height: 56,
              elevation: 2,
              textStyle: AppTextStyles.bold16.copyWith(color: Theme.of(context).colorScheme.surface),
              title: 'تاكيد الحجز',
              icon: Icons.check_circle_outline_outlined,
              onTap: () => notifier.confirmAttendance(),
            ),
            const SizedBox(height: 12),
            SecondBottom(
              title: 'إلغاء الحجز',
              icon: Icons.cancel_outlined,
              onTap: () => notifier.cancelBooking(),
              textColor: Theme.of(context).colorScheme.error,
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    BookingDetailsState state,
    WidgetRef ref,
  ) {
    switch (state.status) {
      case BookingDetailsStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case BookingDetailsStatus.error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.errorMessage ?? 'حدث خطأ',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref
                    .read(bookingDetailsProvider(bookingId).notifier)
                    .loadDetails(),
                child: const Text('إعادة المحاولة'),
              ),
            ],
          ),
        );
      case BookingDetailsStatus.success:
      case BookingDetailsStatus.idle:
        final details = state.details;
        if (details == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCardsSection(
                studentName: details.studentName,
                courseName: details.courseName,
                bookingCode: details.bookingCode,
              ),
              const SizedBox(height: 24),
              PaymentBreakdownSection(
                registrationFee: details.registrationFee,
                remainingFee: details.remainingFee,
                totalPaid: details.totalPaid,
              ),
            ],
          ),
        );
    }
  }
}
