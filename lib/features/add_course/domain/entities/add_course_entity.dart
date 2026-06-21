class AddCourseEntity {
  final String titleAr;
  final String nameAr;
  final String? descriptionAr;
  final double price;
  final String duration;
  final String startDate;
  final String endDate;
  final int departmentId;

  const AddCourseEntity({
    required this.titleAr,
    required this.nameAr,
    this.descriptionAr,
    required this.price,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.departmentId,
  });
}

class CreatedCourse {
  final int id;
  final String? titleAr;
  final String? nameAr;
  final String? descriptionAr;
  final double? price;
  final String? duration;
  final String? startDate;
  final String? endDate;
  final String? departmentName;

  const CreatedCourse({
    required this.id,
    this.titleAr,
    this.nameAr,
    this.descriptionAr,
    this.price,
    this.duration,
    this.startDate,
    this.endDate,
    this.departmentName,
  });
}

class AddCourseValidation {
  final String? titleArError;
  final String? nameArError;
  final String? descriptionArError;
  final String? priceError;
  final String? durationError;
  final String? startDateError;
  final String? endDateError;
  final String? departmentIdError;

  const AddCourseValidation({
    this.titleArError,
    this.nameArError,
    this.descriptionArError,
    this.priceError,
    this.durationError,
    this.startDateError,
    this.endDateError,
    this.departmentIdError,
  });

  bool get hasErrors =>
      titleArError != null ||
      nameArError != null ||
      descriptionArError != null ||
      priceError != null ||
      durationError != null ||
      startDateError != null ||
      endDateError != null ||
      departmentIdError != null;
}

AddCourseValidation? validateAddCourse(AddCourseEntity entity) {
  String? titleArError;
  String? nameArError;
  String? priceError;
  String? durationError;
  String? startDateError;
  String? endDateError;
  String? departmentIdError;

  if (entity.titleAr.trim().isEmpty) {
    titleArError = 'عنوان الكورس مطلوب';
  } else if (entity.titleAr.trim().length < 3) {
    titleArError = 'عنوان الكورس يجب أن يكون 3 أحرف على الأقل';
  }

  if (entity.nameAr.trim().isEmpty) {
    nameArError = 'اسم الكورس مطلوب';
  } else if (entity.nameAr.trim().length < 2) {
    nameArError = 'اسم الكورس يجب أن يكون حرفين على الأقل';
  }

  if (entity.price <= 0) {
    priceError = 'السعر يجب أن يكون أكبر من صفر';
  }

  if (entity.duration.trim().isEmpty) {
    durationError = 'المدة مطلوبة';
  }

  if (entity.startDate.trim().isEmpty) {
    startDateError = 'تاريخ البداية مطلوب';
  }

  if (entity.endDate.trim().isEmpty) {
    endDateError = 'تاريخ النهاية مطلوب';
  }

  if (entity.departmentId <= 0) {
    departmentIdError = 'القسم مطلوب';
  }

  if (titleArError != null ||
      nameArError != null ||
      priceError != null ||
      durationError != null ||
      startDateError != null ||
      endDateError != null ||
      departmentIdError != null) {
    return AddCourseValidation(
      titleArError: titleArError,
      nameArError: nameArError,
      priceError: priceError,
      durationError: durationError,
      startDateError: startDateError,
      endDateError: endDateError,
      departmentIdError: departmentIdError,
    );
  }

  return null;
}