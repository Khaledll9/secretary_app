import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repositories/reports_repository_impl.dart';
import '../../domain/entities/reports_data.dart';
import '../../domain/repositories/reports_repository.dart';
import '../../domain/usecases/get_booking_report.dart';

final reportsRepositoryProvider = Provider<ReportsRepository>((ref) {
  return const ReportsRepositoryImpl();
});

final getBookingReportUseCaseProvider = Provider<GetBookingReport>((ref) {
  final repository = ref.watch(reportsRepositoryProvider);
  return GetBookingReport(repository);
});

final bookingReportProvider =
    StateNotifierProvider<BookingReportNotifier, BookingReportState>((ref) {
  final useCase = ref.watch(getBookingReportUseCaseProvider);
  return BookingReportNotifier(useCase);
});

class BookingReportNotifier extends StateNotifier<BookingReportState> {
  final GetBookingReport _getReport;

  BookingReportNotifier(this._getReport) : super(const BookingReportState()) {
    load();
  }

  Future<void> load() async {
    state = state.copyWith(content: const AsyncValue.loading());
    try {
      final data = await _getReport();
      state = state.copyWith(content: AsyncValue.data(data));
    } catch (error, stackTrace) {
      state = state.copyWith(content: AsyncValue.error(error, stackTrace));
    }
  }
}

class BookingReportState {
  final AsyncValue<BookingReportData> content;

  const BookingReportState({
    this.content = const AsyncValue.loading(),
  });

  BookingReportState copyWith({
    AsyncValue<BookingReportData>? content,
  }) {
    return BookingReportState(
      content: content ?? this.content,
    );
  }
}
