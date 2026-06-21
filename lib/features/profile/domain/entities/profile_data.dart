class ProfileData {
  final String name;
  final String email;
  final String avatarUrl;

  const ProfileData({
    required this.name,
    required this.email,
    this.avatarUrl = '',
  });
}
