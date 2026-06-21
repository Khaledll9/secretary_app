// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AuthDataModel.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'errors': instance.errors,
    };

AuthDataModel _$AuthDataModelFromJson(Map<String, dynamic> json) =>
    AuthDataModel(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthDataModelToJson(AuthDataModel instance) =>
    <String, dynamic>{'token': instance.token, 'user': instance.user};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  instituteId: (json['institute_id'] as num?)?.toInt(),
  isActive: (json['is_active'] as num?)?.toInt(),
  profile: json['profile'] == null
      ? null
      : ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
  roles: (json['roles'] as List<dynamic>?)
      ?.map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'institute_id': instance.instituteId,
  'is_active': instance.isActive,
  'profile': instance.profile,
  'roles': instance.roles,
};

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num?)?.toInt(),
  code: json['code'] as String?,
  fullNameAr: json['full_name_ar'] as String?,
  fullNameEn: json['full_name_en'] as String?,
  phoneNumber: json['phone_number'] as String?,
  gender: json['gender'] as String?,
  logo: json['logo'] as String?,
  city: json['city'] as String?,
  address: json['address'] as String?,
  isActive: (json['is_active'] as num?)?.toInt(),
  profileCompleted: (json['profile_completed'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'code': instance.code,
      'full_name_ar': instance.fullNameAr,
      'full_name_en': instance.fullNameEn,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
      'logo': instance.logo,
      'city': instance.city,
      'address': instance.address,
      'is_active': instance.isActive,
      'profile_completed': instance.profileCompleted,
    };

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  guardName: json['guard_name'] as String?,
);

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'guard_name': instance.guardName,
};
