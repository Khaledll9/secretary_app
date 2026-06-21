import 'package:json_annotation/json_annotation.dart';

part 'add_course_request_model.g.dart';

@JsonSerializable()
class AddCourseRequestModel {
  @JsonKey(name: 'title_ar')
  final String titleAr;
  @JsonKey(name: 'name_ar')
  final String nameAr;
  @JsonKey(name: 'description_ar')
  final String? descriptionAr;
  final double price;
  final String duration;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  @JsonKey(name: 'department_id')
  final int departmentId;

  const AddCourseRequestModel({
    required this.titleAr,
    required this.nameAr,
    this.descriptionAr,
    required this.price,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.departmentId,
  });

  factory AddCourseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddCourseRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCourseRequestModelToJson(this);
}