// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_course_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCourseRequestModel _$AddCourseRequestModelFromJson(
  Map<String, dynamic> json,
) => AddCourseRequestModel(
  titleAr: json['title_ar'] as String,
  nameAr: json['name_ar'] as String,
  descriptionAr: json['description_ar'] as String?,
  price: (json['price'] as num).toDouble(),
  duration: json['duration'] as String,
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  departmentId: (json['department_id'] as num).toInt(),
);

Map<String, dynamic> _$AddCourseRequestModelToJson(
  AddCourseRequestModel instance,
) => <String, dynamic>{
  'title_ar': instance.titleAr,
  'name_ar': instance.nameAr,
  'description_ar': instance.descriptionAr,
  'price': instance.price,
  'duration': instance.duration,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'department_id': instance.departmentId,
};
