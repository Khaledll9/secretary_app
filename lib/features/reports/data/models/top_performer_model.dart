import 'package:json_annotation/json_annotation.dart';

part 'top_performer_model.g.dart';

@JsonSerializable(createToJson: false)
class TopPerformerResponse {
  final bool status;
  final String? message;
  final TopPerformerData? data;
  final Map<String, dynamic>? errors;

  const TopPerformerResponse({
    required this.status,
    this.message,
    this.data,
    this.errors,
  });

  factory TopPerformerResponse.fromJson(Map<String, dynamic> json) =>
      _$TopPerformerResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class TopPerformerData {
  @JsonKey(name: 'top_courses')
  final RankedItems? topCourses;
  @JsonKey(name: 'top_diplomas')
  final RankedItems? topDiplomas;
  @JsonKey(name: 'top_advertisements')
  final RankedItems? topAdvertisements;

  const TopPerformerData({
    this.topCourses,
    this.topDiplomas,
    this.topAdvertisements,
  });

  factory TopPerformerData.fromJson(Map<String, dynamic> json) =>
      _$TopPerformerDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class RankedItems {
  @JsonKey(name: 'by_bookings')
  final List<RankedItem> byBookings;
  @JsonKey(name: 'by_likes')
  final List<RankedItem> byLikes;

  const RankedItems({
    this.byBookings = const [],
    this.byLikes = const [],
  });

  factory RankedItems.fromJson(Map<String, dynamic> json) =>
      _$RankedItemsFromJson(json);
}

@JsonSerializable(createToJson: false)
class RankedItem {
  final int id;
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  @JsonKey(name: 'name_en')
  final String? nameEn;
  @JsonKey(name: 'bookings_count')
  final int bookingsCount;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @JsonKey(name: 'photo_path')
  final String? photoPath;

  const RankedItem({
    required this.id,
    this.nameAr,
    this.nameEn,
    this.bookingsCount = 0,
    this.likesCount = 0,
    this.photoPath,
  });

  factory RankedItem.fromJson(Map<String, dynamic> json) =>
      _$RankedItemFromJson(json);
}
