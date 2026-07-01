import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../providers/add_booking_provider.dart';
import '../widgets/booking_form.dart';
import '../widgets/booking_status_view.dart';

class AddBookingScreen extends ConsumerStatefulWidget {
  const AddBookingScreen({super.key});

  @override
  ConsumerState<AddBookingScreen> createState() => _AddBookingScreenState();
}

class _AddBookingScreenState extends ConsumerState<AddBookingScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addBookingProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'إضافة إعلان جديد'),
      body: BookingStatusView(
        status: state.status,
        errorMessage: state.errorMessage,
        onRetry: () => ref.read(addBookingProvider.notifier).reset(),
        onAddAnother: () => ref.read(addBookingProvider.notifier).reset(),
        form: const BookingForm(),
      ),
    );
  }
}
