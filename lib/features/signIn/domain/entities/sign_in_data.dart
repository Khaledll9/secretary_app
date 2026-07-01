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
  final String? nameAr;
  final String? nameEn;
  final String? email;
  final String? type;

  const AuthUser({
    required this.id,
    this.nameAr,
    this.nameEn,
    this.email,
    this.type,
  });
}
