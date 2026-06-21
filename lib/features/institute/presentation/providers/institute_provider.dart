import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repositories/institute_repository_impl.dart';
import '../../domain/entities/institute_data.dart';
import '../../domain/repositories/institute_repository.dart';
import '../../domain/usecases/get_institute_data.dart';

final instituteRepositoryProvider = Provider<InstituteRepository>((ref) {
  return const InstituteRepositoryImpl();
});

final getInstituteDataUseCaseProvider = Provider<GetInstituteData>((ref) {
  final repository = ref.watch(instituteRepositoryProvider);
  return GetInstituteData(repository);
});

final instituteProvider = StateNotifierProvider<InstituteNotifier, InstituteState>((ref) {
  final getInstituteData = ref.watch(getInstituteDataUseCaseProvider);
  return InstituteNotifier(getInstituteData);
});

class InstituteNotifier extends StateNotifier<InstituteState> {
  final GetInstituteData _getInstituteData;

  InstituteNotifier(this._getInstituteData) : super(const InstituteState()) {
    loadInstituteData();
  }

  Future<void> loadInstituteData() async {
    state = state.copyWith(content: const AsyncValue.loading());
    try {
      final data = await _getInstituteData();
      state = state.copyWith(content: AsyncValue.data(data));
    } catch (error, stackTrace) {
      state = state.copyWith(content: AsyncValue.error(error, stackTrace));
    }
  }
}

class InstituteState {
  final AsyncValue<InstituteData> content;

  const InstituteState({
    this.content = const AsyncValue.loading(),
  });

  InstituteState copyWith({
    AsyncValue<InstituteData>? content,
  }) {
    return InstituteState(
      content: content ?? this.content,
    );
  }
}
