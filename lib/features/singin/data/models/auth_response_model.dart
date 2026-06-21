import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  final bool status;
  final String? message;
  final AuthDataModel? data;
  final Map<String, dynamic>? errors;

  const AuthResponseModel({
    required this.status,
    this.message,
    this.data,
    this.errors,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}

@JsonSerializable()
class AuthDataModel {
  final String? token;
  final UserModel? user;

  const AuthDataModel({this.token, this.user});

  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      _$AuthDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataModelToJson(this);
}

@JsonSerializable()
class UserModel {
  final int id;
  final String? name;
  final String? email;
  @JsonKey(name: 'institute_id')
  final int? instituteId;
  @JsonKey(name: 'is_active')
  final int? isActive;
  final ProfileModel? profile;
  final List<RoleModel>? roles;

  const UserModel({
    required this.id,
    this.name,
    this.email,
    this.instituteId,
    this.isActive,
    this.profile,
    this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class ProfileModel {
  final int id;
  @JsonKey(name: 'user_id')
  final int? userId;
  final String? code;
  @JsonKey(name: 'full_name_ar')
  final String? fullNameAr;
  @JsonKey(name: 'full_name_en')
  final String? fullNameEn;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  final String? gender;
  final String? logo;
  final String? city;
  final String? address;
  @JsonKey(name: 'is_active')
  final int? isActive;
  @JsonKey(name: 'profile_completed')
  final int? profileCompleted;

  const ProfileModel({
    required this.id,
    this.userId,
    this.code,
    this.fullNameAr,
    this.fullNameEn,
    this.phoneNumber,
    this.gender,
    this.logo,
    this.city,
    this.address,
    this.isActive,
    this.profileCompleted,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class RoleModel {
  final int id;
  final String? name;
  @JsonKey(name: 'guard_name')
  final String? guardName;

  const RoleModel({required this.id, this.name, this.guardName});

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}
