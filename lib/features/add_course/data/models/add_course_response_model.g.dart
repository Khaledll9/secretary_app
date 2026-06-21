// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_course_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCourseResponseModel _$AddCourseResponseModelFromJson(
  Map<String, dynamic> json,
) => AddCourseResponseModel(
  status: json['status'] as bool,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : CourseDataModel.fromJson(json['data'] as Map<String, dynamic>),
  errors: json['errors'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$AddCourseResponseModelToJson(
  AddCourseResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
};

CourseDataModel _$CourseDataModelFromJson(Map<String, dynamic> json) =>
    CourseDataModel(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String?,
      slug: json['slug'] as String?,
      titleAr: json['title_ar'] as String?,
      titleEn: json['title_en'] as String?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      descriptionAr: json['description_ar'] as String?,
      descriptionEn: json['description_en'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      duration: json['duration'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      photoUrl: json['photo_url'] as String?,
      isActive: json['is_active'] as bool?,
      isAvailable: json['is_available'] as bool?,
      stats: json['stats'] as List<dynamic>?,
      isLiked: json['is_liked'] as bool?,
      department: json['department'] == null
          ? null
          : DepartmentModel.fromJson(
              json['department'] as Map<String, dynamic>,
            ),
      audit: json['audit'] == null
          ? null
          : AuditModel.fromJson(json['audit'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CourseDataModelToJson(CourseDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'slug': instance.slug,
      'title_ar': instance.titleAr,
      'title_en': instance.titleEn,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'description_ar': instance.descriptionAr,
      'description_en': instance.descriptionEn,
      'price': instance.price,
      'duration': instance.duration,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'photo_url': instance.photoUrl,
      'is_active': instance.isActive,
      'is_available': instance.isAvailable,
      'stats': instance.stats,
      'is_liked': instance.isLiked,
      'department': instance.department,
      'audit': instance.audit,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

DepartmentModel _$DepartmentModelFromJson(Map<String, dynamic> json) =>
    DepartmentModel(
      id: (json['id'] as num).toInt(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      institute: json['institute'] == null
          ? null
          : InstituteModel.fromJson(json['institute'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartmentModelToJson(DepartmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'institute': instance.institute,
    };

InstituteModel _$InstituteModelFromJson(Map<String, dynamic> json) =>
    InstituteModel(
      id: (json['id'] as num).toInt(),
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
    );

Map<String, dynamic> _$InstituteModelToJson(InstituteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
    };

AuditModel _$AuditModelFromJson(Map<String, dynamic> json) => AuditModel(
  createdBy: json['created_by'] == null
      ? null
      : CreatorModel.fromJson(json['created_by'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuditModelToJson(AuditModel instance) =>
    <String, dynamic>{'created_by': instance.createdBy};

CreatorModel _$CreatorModelFromJson(Map<String, dynamic> json) => CreatorModel(
  id: (json['id'] as num?)?.toInt(),
  nameAr: json['name_ar'] as String?,
);

Map<String, dynamic> _$CreatorModelToJson(CreatorModel instance) =>
    <String, dynamic>{'id': instance.id, 'name_ar': instance.nameAr};
