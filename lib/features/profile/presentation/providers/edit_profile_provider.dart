import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repositories/edit_profile_repository_impl.dart';
import '../../domain/entities/edit_profile_data.dart';
import '../../domain/repositories/edit_profile_repository.dart';
import '../../domain/usecases/save_profile.dart';

final editProfileRepositoryProvider = Provider<EditProfileRepository>((ref) {
  return const EditProfileRepositoryImpl();
});

final saveProfileUseCaseProvider = Provider<SaveProfile>((ref) {
  final repository = ref.watch(editProfileRepositoryProvider);
  return SaveProfile(repository);
});

final editProfileProvider =
    StateNotifierProvider<EditProfileNotifier, EditProfileState>((ref) {
  final saveProfile = ref.watch(saveProfileUseCaseProvider);
  return EditProfileNotifier(saveProfile);
});

class EditProfileNotifier extends StateNotifier<EditProfileState> {
  final SaveProfile _saveProfile;

  EditProfileNotifier(this._saveProfile)
      : super(EditProfileState(
          data: const EditProfileData(
            fullName: 'أحمد محمد علي',
            email: 'example@mail.com',
            phone: '+967 123 456 789',
            nationality: 'اليمن',
            gender: 'female',
          ),
        ));

  void setFullName(String v) {
    state = state.copyWith(data: state.data.copyWith(fullName: v));
  }

  void setEmail(String v) {
    state = state.copyWith(data: state.data.copyWith(email: v));
  }

  void setPhone(String v) {
    state = state.copyWith(data: state.data.copyWith(phone: v));
  }

  void setNationality(String v) {
    state = state.copyWith(data: state.data.copyWith(nationality: v));
  }

  void setGender(String v) {
    state = state.copyWith(data: state.data.copyWith(gender: v));
  }

  Future<void> submit() async {
    state = state.copyWith(saveState: const AsyncValue.loading());
    try {
      final success = await _saveProfile(state.data);
      state = state.copyWith(saveState: AsyncValue.data(success));
    } catch (error, stackTrace) {
      state = state.copyWith(saveState: AsyncValue.error(error, stackTrace));
    }
  }
}

class EditProfileState {
  final EditProfileData data;
  final AsyncValue<bool> saveState;

  const EditProfileState({
    this.data = const EditProfileData(),
    this.saveState = const AsyncValue.data(false),
  });

  EditProfileState copyWith({
    EditProfileData? data,
    AsyncValue<bool>? saveState,
  }) {
    return EditProfileState(
      data: data ?? this.data,
      saveState: saveState ?? this.saveState,
    );
  }
}
