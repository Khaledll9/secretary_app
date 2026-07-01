class SignInData {
  final String loginId;
  final String password;

  const SignInData({this.loginId = '', this.password = ''});

  SignInData copyWith({String? loginId, String? password}) {
    return SignInData(
      loginId: loginId ?? this.loginId,
      password: password ?? this.password,
    );
  }
}

class AuthUser {
  final int id;
  final String name;
  final List<String> roles;
  final int? instituteId;
  final String token;

  const AuthUser({
    required this.id,
    required this.name,
    required this.token,
    this.roles = const [],
    this.instituteId,
  });
}
