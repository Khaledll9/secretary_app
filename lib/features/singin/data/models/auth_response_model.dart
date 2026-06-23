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
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;
  @JsonKey(name: 'full_name_ar')
  final String? fullNameAr;
  @JsonKey(name: 'full_name_en')
  final String? fullNameEn;
  final String? email;
  final String? type;
  @JsonKey(name: 'phone')
  final String? phone;

  const UserModel({
    required this.id,
    this.nameAr,
    this.nameEn,
    this.fullNameAr,
    this.fullNameEn,
    this.email,
    this.type,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
