import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repositories/reset_password_repository_impl.dart';
import '../../domain/entities/reset_password_data.dart';
import '../../domain/repositories/reset_password_repository.dart';
import '../../domain/usecases/save_password.dart';

final resetPasswordRepositoryProvider =
    Provider<ResetPasswordRepository>((ref) {
  return const ResetPasswordRepositoryImpl();
});

final savePasswordUseCaseProvider = Provider<SavePassword>((ref) {
  final repository = ref.watch(resetPasswordRepositoryProvider);
  return SavePassword(repository);
});

final resetPasswordProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>((ref) {
  final savePassword = ref.watch(savePasswordUseCaseProvider);
  return ResetPasswordNotifier(savePassword);
});

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final SavePassword _savePassword;

  ResetPasswordNotifier(this._savePassword) : super(const ResetPasswordState());

  void setCurrentPassword(String v) {
    state = state.copyWith(data: state.data.copyWith(currentPassword: v));
  }

  void setNewPassword(String v) {
    state = state.copyWith(data: state.data.copyWith(newPassword: v));
  }

  void setConfirmPassword(String v) {
    state = state.copyWith(data: state.data.copyWith(confirmPassword: v));
  }

  void toggleCurrentVisibility() {
    state = state.copyWith(obscureCurrent: !state.obscureCurrent);
  }

  void toggleNewVisibility() {
    state = state.copyWith(obscureNew: !state.obscureNew);
  }

  void toggleConfirmVisibility() {
    state = state.copyWith(obscureConfirm: !state.obscureConfirm);
  }

  Future<void> submit() async {
    state = state.copyWith(saveState: const AsyncValue.loading());
    try {
      final success = await _savePassword(state.data);
      state = state.copyWith(saveState: AsyncValue.data(success));
    } catch (error, stackTrace) {
      state = state.copyWith(saveState: AsyncValue.error(error, stackTrace));
    }
  }
}

class ResetPasswordState {
  final ResetPasswordData data;
  final bool obscureCurrent;
  final bool obscureNew;
  final bool obscureConfirm;
  final AsyncValue<bool> saveState;

  const ResetPasswordState({
    this.data = const ResetPasswordData(),
    this.obscureCurrent = true,
    this.obscureNew = true,
    this.obscureConfirm = true,
    this.saveState = const AsyncValue.data(false),
  });

  ResetPasswordState copyWith({
    ResetPasswordData? data,
    bool? obscureCurrent,
    bool? obscureNew,
    bool? obscureConfirm,
    AsyncValue<bool>? saveState,
  }) {
    return ResetPasswordState(
      data: data ?? this.data,
      obscureCurrent: obscureCurrent ?? this.obscureCurrent,
      obscureNew: obscureNew ?? this.obscureNew,
      obscureConfirm: obscureConfirm ?? this.obscureConfirm,
      saveState: saveState ?? this.saveState,
    );
  }
}
