import 'package:go_router/go_router.dart';
import 'package:secretary_app/features/add_booking/presentation/screens/add_booking_screen.dart';
import 'package:secretary_app/features/add_course/presentation/screens/add_course_screen.dart';
import 'package:secretary_app/features/booking/presentation/screens/booking_details_screen.dart';
import 'package:secretary_app/features/booking/presentation/screens/bookings_screen.dart';
import 'package:secretary_app/features/booking/presentation/screens/confirm_attendance_screen.dart';
import 'package:secretary_app/features/course_details/presentation/screens/course_details_screen.dart';
import 'package:secretary_app/features/my_courses/presentation/screens/courses_screen.dart';
import 'package:secretary_app/features/my_courses/presentation/screens/for_booking_screen.dart';
import 'package:secretary_app/features/my_courses/presentation/screens/my_courses_screen.dart';
import 'package:secretary_app/features/notifications/presentation/screens/add_notification_screen.dart';
import 'package:secretary_app/features/notifications/presentation/screens/notification_screen.dart';
import 'package:secretary_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:secretary_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:secretary_app/features/reports/presentation/screens/booking_report_screen.dart';
import 'package:secretary_app/features/reports/presentation/screens/courses_reports_screen.dart';
import 'package:secretary_app/features/reports/presentation/screens/reports_screen.dart';
import 'package:secretary_app/features/singin/presentation/screens/sign_in_screen.dart';

import '../../features/institute/presentation/screens/institute_info_screen.dart';
import '../../features/profile/presentation/screens/change_password_screen.dart';
import '../../features/profile/presentation/screens/edit_profile_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: AppRoutes.onBoarding,
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: AppRoutes.login,
        path: '/login',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: AppRoutes.home,
        path: '/',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: AppRoutes.profile,
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        name: AppRoutes.bookings,
        path: '/bookings',
        builder: (context, state) => const BookingsScreen(),
      ),
      GoRoute(
        name: AppRoutes.myCourses,
        path: '/my-courses',
        builder: (context, state) => const MyCoursesScreen(),
      ),
      GoRoute(
        name: AppRoutes.reports,
        path: '/reports',
        builder: (context, state) => const ReportsScreen(),
      ),
      GoRoute(
        name: AppRoutes.addBooking,
        path: '/add-booking',
        builder: (context, state) => const AddBookingScreen(),
      ),
      GoRoute(
        name: AppRoutes.addCourse,
        path: '/add-course',
        builder: (context, state) => const AddCourseScreen(),
      ),
      GoRoute(
        name: AppRoutes.courses,
        path: '/courses',
        builder: (context, state) => const CoursesScreen(),
      ),
      GoRoute(
        name: AppRoutes.notifications,
        path: '/notifications',
        builder: (context, state) => const NotificationScreen(),
      ),
      GoRoute(
        name: AppRoutes.addNotification,
        path: '/add-notification',
        builder: (context, state) => const AddNotificationScreen(),
      ),
      GoRoute(
        name: AppRoutes.bookingDetails,
        path: '/book/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return BookingDetailsScreen(bookingId: id);
        },
      ),
      GoRoute(
        name: AppRoutes.courseDetails,
        path: '/course-Details',
        builder: (context, state) => const CourseDetailsScreen(),
      ),
      GoRoute(
        name: AppRoutes.confirmAttendance,
        path: '/book/:id/confirm',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return ConfirmAttendanceScreen(bookingId: id);
        },
      ),
      GoRoute(
        name: AppRoutes.editProfile,
        path: '/edit-profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        name: AppRoutes.instituteInfo,
        path: '/institute-info',
        builder: (context, state) => const InstituteInfoScreen(),
      ),
      GoRoute(
        name: AppRoutes.changePassword,
        path: '/change-password',
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        name: AppRoutes.bookingReport,
        path: '/booking-report',
        builder: (context, state) => const BookingReportScreen(),
      ),
      GoRoute(
        name: AppRoutes.coursesReports,
        path: '/courses-report',
        builder: (context, state) => const CoursesReportsScreen(),
      ),
      GoRoute(
        name: AppRoutes.forBooking,
        path: '/for-booking',
        builder: (context, state) => const ForBookingScreen(),
      ),
    ],
  );
}

class AppRoutes {
  static const String onBoarding = 'onBoarding';
  static const String login = 'login';
  static const String home = 'home';
  static const String profile = 'profile';
  static const String bookings = 'bookings';
  static const String myCourses = 'myCourses';
  static const String reports = 'reports';
  static const String addBooking = 'addBooking';
  static const String addCourse = 'addCourse';
  static const String courses = 'courses';
  static const String notifications = 'notifications';
  static const String addNotification = 'addNotification';
  static const String courseDetails = 'courseDetails';
  static const String bookingDetails = 'bookingDetails';
  static const String confirmAttendance = 'confirmAttendance';
  static const String editProfile = 'editProfile';
  static const String instituteInfo = 'instituteInfo';
  static const String changePassword = 'changePassword';
  static const String bookingReport = 'bookingReport';
  static const String coursesReports = 'coursesReports';
  static const String forBooking = 'forBooking';
}
