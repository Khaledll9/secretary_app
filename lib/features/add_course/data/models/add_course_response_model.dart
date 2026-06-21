import 'package:json_annotation/json_annotation.dart';

part 'add_course_response_model.g.dart';

@JsonSerializable()
class AddCourseResponseModel {
  final bool status;
  final String? message;
  final CourseDataModel? data;
  final Map<String, dynamic>? errors;

  const AddCourseResponseModel({
    required this.status,
    this.message,
    this.data,
    this.errors,
  });

  factory AddCourseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddCourseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCourseResponseModelToJson(this);
}

@JsonSerializable()
class CourseDataModel {
  final int id;
  final String? code;
  final String? slug;
  @JsonKey(name: 'title_ar')
  final String? titleAr;
  @JsonKey(name: 'title_en')
  final String? titleEn;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;
  @JsonKey(name: 'description_ar')
  final String? descriptionAr;
  @JsonKey(name: 'description_en')
  final String? descriptionEn;
  final double? price;
  final String? duration;
  @JsonKey(name: 'start_date')
  final String? startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'is_available')
  final bool? isAvailable;
  final List<dynamic>? stats;
  @JsonKey(name: 'is_liked')
  final bool? isLiked;
  final DepartmentModel? department;
  final AuditModel? audit;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const CourseDataModel({
    required this.id,
    this.code,
    this.slug,
    this.titleAr,
    this.titleEn,
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.price,
    this.duration,
    this.startDate,
    this.endDate,
    this.photoUrl,
    this.isActive,
    this.isAvailable,
    this.stats,
    this.isLiked,
    this.department,
    this.audit,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseDataModel.fromJson(Map<String, dynamic> json) =>
      _$CourseDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDataModelToJson(this);
}

@JsonSerializable()
class DepartmentModel {
  final int id;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;
  final InstituteModel? institute;

  const DepartmentModel({
    required this.id,
    this.nameAr,
    this.nameEn,
    this.institute,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentModelToJson(this);
}

@JsonSerializable()
class InstituteModel {
  final int id;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;

  const InstituteModel({
    required this.id,
    this.nameAr,
    this.nameEn,
  });

  factory InstituteModel.fromJson(Map<String, dynamic> json) =>
      _$InstituteModelFromJson(json);

  Map<String, dynamic> toJson() => _$InstituteModelToJson(this);
}

@JsonSerializable()
class AuditModel {
  @JsonKey(name: 'created_by')
  final CreatorModel? createdBy;

  const AuditModel({this.createdBy});

  factory AuditModel.fromJson(Map<String, dynamic> json) =>
      _$AuditModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuditModelToJson(this);
}

@JsonSerializable()
class CreatorModel {
  final int? id;
  @JsonKey(name: 'name_ar')
  final String? nameAr;

  const CreatorModel({this.id, this.nameAr});

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorModelToJson(this);
}