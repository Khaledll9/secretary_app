// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_performer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopPerformerResponse _$TopPerformerResponseFromJson(
  Map<String, dynamic> json,
) => TopPerformerResponse(
  status: json['status'] as bool,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : TopPerformerData.fromJson(json['data'] as Map<String, dynamic>),
  errors: json['errors'] as Map<String, dynamic>?,
);

TopPerformerData _$TopPerformerDataFromJson(Map<String, dynamic> json) =>
    TopPerformerData(
      topCourses: json['top_courses'] == null
          ? null
          : RankedItems.fromJson(json['top_courses'] as Map<String, dynamic>),
      topDiplomas: json['top_diplomas'] == null
          ? null
          : RankedItems.fromJson(json['top_diplomas'] as Map<String, dynamic>),
      topAdvertisements: json['top_advertisements'] == null
          ? null
          : RankedItems.fromJson(
              json['top_advertisements'] as Map<String, dynamic>,
            ),
    );

RankedItems _$RankedItemsFromJson(Map<String, dynamic> json) => RankedItems(
  byBookings:
      (json['by_bookings'] as List<dynamic>?)
          ?.map((e) => RankedItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  byLikes:
      (json['by_likes'] as List<dynamic>?)
          ?.map((e) => RankedItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

RankedItem _$RankedItemFromJson(Map<String, dynamic> json) => RankedItem(
  id: (json['id'] as num).toInt(),
  nameAr: json['name_ar'] as String?,
  nameEn: json['name_en'] as String?,
  bookingsCount: (json['bookings_count'] as num?)?.toInt() ?? 0,
  likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
  photoPath: json['photo_path'] as String?,
);
