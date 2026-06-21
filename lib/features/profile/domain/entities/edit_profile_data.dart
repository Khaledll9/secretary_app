class EditProfileData {
  final String fullName;
  final String email;
  final String phone;
  final String nationality;
  final String gender;

  const EditProfileData({
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.nationality = '',
    this.gender = 'male',
  });

  EditProfileData copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? nationality,
    String? gender,
  }) {
    return EditProfileData(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      nationality: nationality ?? this.nationality,
      gender: gender ?? this.gender,
    );
  }
}
