import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/api/api_provider.dart';
import '../../data/repositories/sign_in_repository_impl.dart';
import '../../domain/entities/sign_in_data.dart';
import '../../domain/repositories/sign_in_repository.dart';
import '../../domain/usecases/sign_in.dart';

final signInRepositoryProvider = Provider<SignInRepository>((ref) {
  final api = ref.watch(apiConsumerProvider);
  return SignInRepositoryImpl(api: api);
});

final signInUseCaseProvider = Provider<SignIn>((ref) {
  final repository = ref.watch(signInRepositoryProvider);
  return SignIn(repository);
});

final signInProvider =
    StateNotifierProvider<SignInNotifier, SignInState>((ref) {
  final signIn = ref.watch(signInUseCaseProvider);
  return SignInNotifier(signIn);
});

class SignInNotifier extends StateNotifier<SignInState> {
  final SignIn _signIn;

  SignInNotifier(this._signIn) : super(const SignInState());

  void setEmail(String value) {
    state = state.copyWith(
      data: state.data.copyWith(loginId: value),
      loginIdError: null,
    );
  }

  void setPassword(String password) {
    state = state.copyWith(
      data: state.data.copyWith(password: password),
      passwordError: null,
    );
  }

  void togglePasswordVisibility() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  bool _validate() {
    final loginId = state.data.loginId.trim();
    final password = state.data.password;

    bool valid = true;

    if (loginId.isEmpty) {
      state = state.copyWith(loginIdError: 'البريد الإلكتروني مطلوب');
      valid = false;
    } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(loginId)) {
      state = state.copyWith(loginIdError: 'البريد الإلكتروني غير صالح');
      valid = false;
    }

    if (password.isEmpty) {
      state = state.copyWith(passwordError: 'كلمة المرور مطلوبة');
      valid = false;
    } else if (password.length < 6) {
      state = state.copyWith(
        passwordError: 'كلمة المرور يجب أن تكون 6 أحرف على الأقل',
      );
      valid = false;
    }

    return valid;
  }

  Future<void> submit() async {
    if (!_validate()) return;

    state = state.copyWith(authState: const AsyncValue.loading());

    try {
      final user = await _signIn(state.data);
      state = state.copyWith(authState: AsyncValue.data(user));
    } catch (error, stackTrace) {
      final message = error.toString().replaceFirst('Exception: ', '');
      state = state.copyWith(
        authState: AsyncValue.error(message, stackTrace),
        passwordError: null,
      );
    }
  }

  void retry() {
    state = state.copyWith(authState: const AsyncValue.data(null));
  }

  void reset() {
    state = const SignInState();
  }
}

class SignInState {
  final SignInData data;
  final bool obscurePassword;
  final AsyncValue<AuthUser?> authState;
  final String? loginIdError;
  final String? passwordError;

  const SignInState({
    this.data = const SignInData(),
    this.obscurePassword = true,
    this.authState = const AsyncValue.data(null),
    this.loginIdError,
    this.passwordError,
  });

  bool get hasValidationErrors =>
      loginIdError != null || passwordError != null;

  bool get isAuthLoading => authState.isLoading;

  SignInState copyWith({
    SignInData? data,
    bool? obscurePassword,
    AsyncValue<AuthUser?>? authState,
    String? loginIdError,
    String? passwordError,
  }) {
    return SignInState(
      data: data ?? this.data,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      authState: authState ?? this.authState,
      loginIdError: loginIdError,
      passwordError: passwordError,
    );
  }
}
