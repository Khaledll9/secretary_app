import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../domain/entities/reports_data.dart';
import '../../domain/usecases/get_courses_report.dart';
import 'reports_provider.dart';

final getCoursesReportUseCaseProvider = Provider<GetCoursesReport>((ref) {
  final repository = ref.watch(reportsRepositoryProvider);
  return GetCoursesReport(repository);
});

final coursesReportsProvider =
    StateNotifierProvider<CoursesReportsNotifier, CoursesReportsState>((ref) {
  final useCase = ref.watch(getCoursesReportUseCaseProvider);
  return CoursesReportsNotifier(useCase);
});

class CoursesReportsNotifier extends StateNotifier<CoursesReportsState> {
  final GetCoursesReport _getCoursesReport;

  CoursesReportsNotifier(this._getCoursesReport) : super(const CoursesReportsState()) {
    load();
  }

  void setCategory(String category) {
    final updated = state.data?.copyWith(selectedCategory: category) ?? state.data;
    state = state.copyWith(data: updated);
  }

  Future<void> load() async {
    state = state.copyWith(content: const AsyncValue.loading());
    try {
      final data = await _getCoursesReport();
      state = state.copyWith(
        content: AsyncValue.data(data),
        data: data,
      );
    } catch (error, stackTrace) {
      state = state.copyWith(content: AsyncValue.error(error, stackTrace));
    }
  }

  void reset() {
    state = const CoursesReportsState();
  }
}

class CoursesReportsState {
  final AsyncValue<CoursesReportData> content;
  final CoursesReportData? data;

  const CoursesReportsState({
    this.content = const AsyncValue.loading(),
    this.data,
  });

  CoursesReportsState copyWith({
    AsyncValue<CoursesReportData>? content,
    CoursesReportData? data,
  }) {
    return CoursesReportsState(
      content: content ?? this.content,
      data: data ?? this.data,
    );
  }
}
