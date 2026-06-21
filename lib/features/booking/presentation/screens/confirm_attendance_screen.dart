import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import '../../../../core/widgets/primary_bottom.dart';
import '../../../../core/widgets/second_bottom.dart';
import '../providers/confirm_attendance_provider.dart';
import '../widgets/booking/course_details_section.dart';
import '../widgets/booking/payment_breakdown_section.dart';
import '../widgets/booking/student_profile_section.dart';

class ConfirmAttendanceScreen extends ConsumerWidget {
  final String bookingId;

  const ConfirmAttendanceScreen({super.key, required this.bookingId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(confirmAttendanceProvider(bookingId).notifier);
    final state = ref.watch(confirmAttendanceProvider(bookingId));

    if (state.status == ConfirmAttendanceStatus.idle &&
        state.attendance == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifier.loadAttendance();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('تأكيد الحجز', style: AppTextStyles.bold18),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.outline,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: _buildBody(context, state, ref),
    );
  }

  Widget _buildBody(
    BuildContext context,
    ConfirmAttendanceState state,
    WidgetRef ref,
  ) {
    final notifier = ref.read(confirmAttendanceProvider(bookingId).notifier);

    switch (state.status) {
      case ConfirmAttendanceStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case ConfirmAttendanceStatus.error:
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.errorMessage ?? 'حدث خطأ',
                  style: AppTextStyles.medium16.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => notifier.loadAttendance(),
                  child: const Text('إعادة المحاولة'),
                ),
              ],
            ),
          ),
        );
      case ConfirmAttendanceStatus.success:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 64, color: Theme.of(context).colorScheme.tertiary),
              const SizedBox(height: 16.0),
              Text('تم تأكيد الحضور بنجاح', style: AppTextStyles.bold20),
            ],
          ),
        );
      case ConfirmAttendanceStatus.idle:
        return _buildContent(context, state, ref);
    }
  }

  Widget _buildContent(
    BuildContext context,
    ConfirmAttendanceState state,
    WidgetRef ref,
  ) {
    final notifier = ref.read(confirmAttendanceProvider(bookingId).notifier);
    final attendance = state.attendance;

    if (attendance == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StudentProfileSection(
                  studentName: attendance.studentName,
                  bookingCode: attendance.bookingCode,
                ),
                const SizedBox(height: 24),
                CourseDetailsSection(
                  courseName: attendance.courseName,
                  instructorName: attendance.instructorName,
                ),
                const SizedBox(height: 24),
                PaymentBreakdownSection(
                  registrationFee: attendance.registrationFee,
                  remainingFee: attendance.remainingFee,
                  totalPaid: attendance.totalPaid,
                ),
                const SizedBox(height: 24),
                PrimaryBottom(
                  elevation: 2,
                  height: 56,
                  textStyle: AppTextStyles.bold16.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                  ),
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
        ),
      ],
    );
  }
}
