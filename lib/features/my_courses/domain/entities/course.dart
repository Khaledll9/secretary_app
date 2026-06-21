class Course {
  final int id;
  final String title;
  final String description;
  final String category;
  final String tag;
  final double price;
  final String? duration;
  final String? startDate;
  final String? endDate;
  final String? photoUrl;
  final int? sessionsCount;
  final int? durationHours;
  final bool? isActive;
  final bool? isAvailable;
  final bool? isLiked;
  final String? departmentName;
  final String? instituteName;

  const Course({
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
    this.sessionsCount,
    this.durationHours,
    this.isActive,
    this.isAvailable,
    this.isLiked,
    this.departmentName,
    this.instituteName,
  });
}
