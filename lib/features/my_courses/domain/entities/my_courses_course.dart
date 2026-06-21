class MyCoursesCourse {
  final int id;
  final String title;
  final String description;
  final String category;
  final String tag;
  final String price;
  final String? duration;
  final String? startDate;
  final String? endDate;
  final String? photoUrl;
  final bool? isActive;
  final bool? isAvailable;
  final bool? isLiked;
  final String? departmentName;
  final String? instituteName;

  const MyCoursesCourse({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.tag,
    required this.price,
    this.duration,
    this.startDate,
    this.endDate,
    this.photoUrl,
    this.isActive,
    this.isAvailable,
    this.isLiked,
    this.departmentName,
    this.instituteName,
  });
}
