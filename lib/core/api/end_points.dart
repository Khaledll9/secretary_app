class ApiKey {
  // General
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String message = "message";
  static String id = "id";
  static String token = "token";
  static String data = "data";
  static String errors = "errors";

  // User / Auth
  static String email = "email";
  static String password = "password";
  static String loginId = "login_id";
  static String passwordConfirmation = "password_confirmation";
  static String name = "name";
  static String nameAr = "name_ar";
  static String nameEn = "name_en";
  static String fullNameAr = "full_name_ar";
  static String fullNameEn = "full_name_en";
  static String user = "user";
  static String userType = "type";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String imagePic = "imagePic";

  // Course keys
  static String code = "code";
  static String slug = "slug";
  static String titleAr = "title_ar";
  static String titleEn = "title_en";
  static String descriptionAr = "description_ar";
  static String descriptionEn = "description_en";
  static String price = "price";
  static String duration = "duration";
  static String startDate = "start_date";
  static String endDate = "end_date";
  static String photoUrl = "photo_url";
  static String isActive = "is_active";
  static String isAvailable = "is_available";
  static String stats = "stats";
  static String isLiked = "is_liked";
  static String department = "department";
  static String audit = "audit";
  static String createdAt = "created_at";
  static String updatedAt = "updated_at";
  static String departmentId = "department_id";
  static String institute = "institute";
  static String createdBy = "created_by";
}

class EndPoint {
  static String baseUrl = "http://127.0.0.1:8000/api/v1/";
  // Auth
  static String login = "auth/login";

  // Courses
  static String viewCourses = "view/courses";

  static String storeCourse = "courses";
  static String destroyCourse(int id) => "courses/destroy/$id";
  static String getUserDataEndPoint(int id) => "user/get-user/$id";
  static String toggleCourseStatus(int id) => "courses/toggle-status/$id";
  static String updateCourse(int id) => "courses/update/$id";
  static String viewCourse(int id) => "view/courses/$id";
}
