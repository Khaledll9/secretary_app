class ResetPasswordData {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  const ResetPasswordData({
    this.currentPassword = '',
    this.newPassword = '',
    this.confirmPassword = '',
  });

  ResetPasswordData copyWith({
    String? currentPassword,
    String? newPassword,
    String? confirmPassword,
  }) {
    return ResetPasswordData(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
