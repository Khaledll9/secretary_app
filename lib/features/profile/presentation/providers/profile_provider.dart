import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/entities/profile_data.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/get_profile_data.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return const ProfileRepositoryImpl();
});

final getProfileDataUseCaseProvider = Provider<GetProfileData>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return GetProfileData(repository);
});

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  final getProfileData = ref.watch(getProfileDataUseCaseProvider);
  return ProfileNotifier(getProfileData);
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  final GetProfileData _getProfileData;

  ProfileNotifier(this._getProfileData) : super(const ProfileState()) {
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    state = state.copyWith(content: const AsyncValue.loading());
    try {
      final data = await _getProfileData();
      state = state.copyWith(content: AsyncValue.data(data));
    } catch (error, stackTrace) {
      state = state.copyWith(content: AsyncValue.error(error, stackTrace));
    }
  }
}

class ProfileState {
  final AsyncValue<ProfileData> content;

  const ProfileState({
    this.content = const AsyncValue.loading(),
  });

  ProfileState copyWith({
    AsyncValue<ProfileData>? content,
  }) {
    return ProfileState(
      content: content ?? this.content,
    );
  }
}
