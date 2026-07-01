import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/add_booking_provider.dart';

class BookingStatusView extends StatelessWidget {
  final AddBookingStatus status;
  final String? errorMessage;
  final VoidCallback onRetry;
  final VoidCallback onAddAnother;
  final Widget form;

  const BookingStatusView({
    super.key,
    required this.status,
    this.errorMessage,
    required this.onRetry,
    required this.onAddAnother,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AddBookingStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case AddBookingStatus.error:
        return BookingErrorView(message: errorMessage, onRetry: onRetry);
      case AddBookingStatus.success:
        return BookingSuccessView(onAddAnother: onAddAnother);
      case AddBookingStatus.idle:
        return form;
    }
  }
}

class BookingErrorView extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;

  const BookingErrorView({super.key, this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message ?? 'حدث خطأ',
              style: AppTextStyles.medium16.copyWith(color: theme.colorScheme.error),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: onRetry, child: const Text('إعادة المحاولة')),
          ],
        ),
      ),
    );
  }
}

class BookingSuccessView extends StatelessWidget {
  final VoidCallback onAddAnother;

  const BookingSuccessView({super.key, required this.onAddAnother});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, size: 64, color: theme.colorScheme.tertiary),
          const SizedBox(height: 16),
          const Text('تم إضافة الإعلان بنجاح', style: AppTextStyles.bold20),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: onAddAnother, child: const Text('إضافة إعلان آخر')),
        ],
      ),
    );
  }
}
