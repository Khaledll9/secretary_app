import 'package:flutter/material.dart';

import '../../domain/entities/reports_data.dart';
import '../../domain/repositories/reports_repository.dart';

class ReportsRepositoryImpl implements ReportsRepository {
  const ReportsRepositoryImpl();

  @override
  Future<BookingReportData> getBookingReport() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    return const BookingReportData();
  }

  @override
  Future<CoursesReportData> getCoursesReport() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const CoursesReportData();
  }

  @override
  Future<ReportsData> getReportsData() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));

    return const ReportsData(
      adStats: [
        StatItem(
          label: 'في الانتظار',
          value: '8',
          iconBgColor: Color(0xFFE5E7EA),
          iconColor: Color(0xFF64748B),
          iconType: IconType.clock,
        ),
        StatItem(
          label: 'مؤكد',
          value: '45',
          iconBgColor: Color(0xFFEDEFFE),
          iconColor: Color(0xFF4C68D5),
          iconType: IconType.checkCircle,
        ),
        StatItem(
          label: 'الإيرادات اليومية',
          value: '80,000',
          iconBgColor: Color(0xFFFEF3C7),
          iconColor: Color(0xFFD97706),
          iconType: IconType.trendingUp,
        ),
        StatItem(
          label: 'حضروا',
          value: '%89',
          iconBgColor: Color(0xFFD1FAE5),
          iconColor: Color(0xFF059669),
          iconType: IconType.users,
        ),
      ],
      courseStats: [
        StatItem(
          label: 'الدبلومات',
          value: '6',
          iconBgColor: Color(0xFFF3E8FF),
          iconColor: Color(0xFF9333EA),
          iconType: IconType.diploma,
        ),
        StatItem(
          label: 'الدورات',
          value: '36',
          iconBgColor: Color(0xFFFEF3C7),
          iconColor: Color(0xFFD97706),
          iconType: IconType.course,
        ),
      ],
      recentActivities: [
        ActivityItem(
          text: 'تم إرسال تنبيه لـ 45 طالب مهتمين بـ "دورة اللغة الإنجليزية"',
          timestamp: 'منذ ١٥ دقيقة',
          iconBgColor: 0xFFEDEFFE,
          iconType: IconType.notification,
        ),
        ActivityItem(
          text: 'تم تأكيد حجز الطالب "أحمد علي" بنجاح',
          timestamp: 'منذ ساعة واحدة',
          iconBgColor: 0xFFD1FAE5,
          iconType: IconType.booking,
        ),
        ActivityItem(
          text: 'تعديل بيانات دبلوم الرخصة الدولية',
          timestamp: 'منذ ٣ ساعات',
          iconBgColor: 0xFFEDEFFE,
          iconType: IconType.edit,
        ),
      ],
    );
  }
}
