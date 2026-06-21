import 'package:flutter/material.dart';

class ActivityItem {
  final String text;
  final String timestamp;
  final int iconBgColor;
  final IconType iconType;

  const ActivityItem({
    required this.text,
    required this.timestamp,
    required this.iconBgColor,
    required this.iconType,
  });
}

enum IconType {
  clock,
  checkCircle,
  trendingUp,
  users,
  diploma,
  course,
  notification,
  booking,
  edit,
}

class ReportsData {
  final List<StatItem> adStats;
  final List<StatItem> courseStats;
  final List<ActivityItem> recentActivities;

  const ReportsData({
    required this.adStats,
    required this.courseStats,
    required this.recentActivities,
  });
}

class StatItem {
  final String label;
  final String value;
  final Color iconBgColor;
  final Color iconColor;
  final IconType iconType;

  const StatItem({
    required this.label,
    required this.value,
    required this.iconBgColor,
    required this.iconColor,
    required this.iconType,
  });
}

class BookingReportData {
  final int totalBookings;
  final int confirmed;
  final double pendingPayments;
  final int completionPercent;
  final int newBookings;
  final int totalStudents;
  final int completionRate;
  final List<StatusDistribution> statusDistribution;
  final List<CourseBooking> courseBookings;

  const BookingReportData({
    this.totalBookings = 8,
    this.confirmed = 45,
    this.pendingPayments = 80000,
    this.completionPercent = 89,
    this.newBookings = 12,
    this.totalStudents = 450,
    this.completionRate = 98,
    this.statusDistribution = const [
      StatusDistribution(label: 'مؤكد', percent: 60, color: 0xFF4C68D5),
      StatusDistribution(label: 'معلق', percent: 30, color: 0xFFD97706),
      StatusDistribution(label: 'ملغي', percent: 10, color: 0xFF059669),
    ],
    this.courseBookings = const [
      CourseBooking(name: 'دورة اللغة الإنجليزية', count: 150, barRatio: 0.85),
      CourseBooking(name: 'دورات البرمجة المتقدمة', count: 122, barRatio: 0.65),
      CourseBooking(name: 'تصميم واجهات المستخدم (UX/UI)', count: 60, barRatio: 0.55),
      CourseBooking(name: 'دورة التسويق الإلكتروني', count: 60, barRatio: 0.40),
    ],
  });
}

class StatusDistribution {
  final String label;
  final int percent;
  final int color;
  const StatusDistribution({
    required this.label,
    required this.percent,
    required this.color,
  });
}

class CourseBooking {
  final String name;
  final int count;
  final double barRatio;
  const CourseBooking({
    required this.name,
    required this.count,
    required this.barRatio,
  });
}

class CoursesReportData {
  final int diplomaCount;
  final int courseCount;
  final int totalCourses;
  final String selectedCategory;
  final List<TopCourse> topCourses;

  const CoursesReportData({
    this.diplomaCount = 6,
    this.courseCount = 36,
    this.totalCourses = 12,
    this.selectedCategory = '',
    this.topCourses = const [
      TopCourse(name: 'اللغة الإنجليزية - المستوى 1', students: '42 طالب'),
      TopCourse(name: 'تصميم واجهة المستخدم UI/UX', students: '28 طالب'),
      TopCourse(name: 'الرياضيات المتقدمة', students: '35 طالب'),
      TopCourse(name: 'أساسيات البرمجة', students: '20 طالب'),
    ],
  });

  CoursesReportData copyWith({
    String? selectedCategory,
  }) {
    return CoursesReportData(
      diplomaCount: diplomaCount,
      courseCount: courseCount,
      totalCourses: totalCourses,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      topCourses: topCourses,
    );
  }
}

class TopCourse {
  final String name;
  final String students;

  const TopCourse({
    required this.name,
    required this.students,
  });
}
