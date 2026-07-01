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
class RoleModel {
  final String name;

  const RoleModel({required this.name});

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final List<RoleModel>? roles;

  @JsonKey(name: 'institute_id')
  final int? instituteId;

  const UserModel({
    required this.id,
    required this.name,
    this.roles,
    this.instituteId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
