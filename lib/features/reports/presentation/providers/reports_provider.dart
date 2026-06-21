import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/api/api_provider.dart';
import '../../data/repositories/reports_repository_impl.dart';
import '../../domain/entities/reports_data.dart';
import '../../domain/repositories/reports_repository.dart';
import '../../domain/usecases/get_reports_data.dart';

final reportsRepositoryProvider = Provider<ReportsRepository>((ref) {
  final api = ref.watch(apiConsumerProvider);
  return ReportsRepositoryImpl(api: api);
});

final getReportsDataUseCaseProvider = Provider<GetReportsData>((ref) {
  final repository = ref.watch(reportsRepositoryProvider);
  return GetReportsData(repository);
});

final reportsProvider =
    StateNotifierProvider<ReportsNotifier, ReportsState>((ref) {
  final getReportsData = ref.watch(getReportsDataUseCaseProvider);
  return ReportsNotifier(getReportsData);
});

class ReportsNotifier extends StateNotifier<ReportsState> {
  final GetReportsData _getReportsData;

  ReportsNotifier(this._getReportsData) : super(const ReportsState()) {
    loadReportsData();
  }

  Future<void> loadReportsData() async {
    state = state.copyWith(content: const AsyncValue.loading());
    try {
      final data = await _getReportsData();
      state = state.copyWith(content: AsyncValue.data(data));
    } catch (error, stackTrace) {
      state = state.copyWith(content: AsyncValue.error(error, stackTrace));
    }
  }
}

class ReportsState {
  final AsyncValue<ReportsData> content;

  const ReportsState({
    this.content = const AsyncValue.loading(),
  });

  ReportsState copyWith({
    AsyncValue<ReportsData>? content,
  }) {
    return ReportsState(
      content: content ?? this.content,
    );
  }
}
