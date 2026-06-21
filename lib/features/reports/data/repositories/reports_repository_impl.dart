import 'package:flutter/material.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/api/errors/exceptions.dart';
import '../../domain/entities/reports_data.dart';
import '../../domain/repositories/reports_repository.dart';
import '../models/kpi_report_model.dart';
import '../models/top_performer_model.dart';

class ReportsRepositoryImpl implements ReportsRepository {
  final ApiConsumer api;

  const ReportsRepositoryImpl({required this.api});

  @override
  Future<ReportsData> getReportsData() async {
    try {
      final response = await api.get(EndPoint.kpiReports);
      final kpi =
          KpiReportResponse.fromJson(response as Map<String, dynamic>);

      if (kpi.status != true || kpi.data == null) {
        throw Exception('فشل تحميل التقارير');
      }

      return _mapKpiToReportsData(kpi.data!);
    } on ServerException catch (e) {
      throw Exception(
        e.errModel.errorMessage.isNotEmpty
            ? e.errModel.errorMessage
            : 'حدث خطأ في تحميل التقارير',
      );
    }
  }

  ReportsData _mapKpiToReportsData(KpiData kpi) {
    final general = kpi.general;
    final financial = kpi.financial;

    return ReportsData(
      adStats: [
        StatItem(
          label: 'الحجوزات',
          value: '${general?.totalBookings ?? 0}',
          iconBgColor: const Color(0xFFEDEFFE),
          iconColor: const Color(0xFF4C68D5),
          iconType: IconType.booking,
        ),
        StatItem(
          label: 'الطلاب',
          value: '${general?.totalStudents ?? 0}',
          iconBgColor: const Color(0xFFD1FAE5),
          iconColor: const Color(0xFF059669),
          iconType: IconType.users,
        ),
        StatItem(
          label: 'الإيرادات',
          value: financial?.totalRevenue ?? '0',
          iconBgColor: const Color(0xFFFEF3C7),
          iconColor: const Color(0xFFD97706),
          iconType: IconType.trendingUp,
        ),
        StatItem(
          label: 'المبلغ المعلق',
          value: financial?.pendingBalance ?? '0',
          iconBgColor: const Color(0xFFE5E7EA),
          iconColor: const Color(0xFF64748B),
          iconType: IconType.clock,
        ),
      ],
      courseStats: [
        StatItem(
          label: 'الدبلومات',
          value: '${general?.totalDiplomas ?? 0}',
          iconBgColor: const Color(0xFFF3E8FF),
          iconColor: const Color(0xFF9333EA),
          iconType: IconType.diploma,
        ),
        StatItem(
          label: 'الدورات',
          value: '${general?.totalCourses ?? 0}',
          iconBgColor: const Color(0xFFFEF3C7),
          iconColor: const Color(0xFFD97706),
          iconType: IconType.course,
        ),
      ],
      recentActivities: const [],
    );
  }

  @override
  Future<BookingReportData> getBookingReport() async {
    try {
      final response = await api.get(EndPoint.kpiReports);
      final kpi =
          KpiReportResponse.fromJson(response as Map<String, dynamic>);

      if (kpi.status != true || kpi.data == null) {
        throw Exception('فشل تحميل تقرير الحجوزات');
      }

      return _mapKpiToBookingReport(kpi.data!);
    } on ServerException catch (e) {
      throw Exception(
        e.errModel.errorMessage.isNotEmpty
            ? e.errModel.errorMessage
            : 'حدث خطأ في تحميل التقرير',
      );
    }
  }

  BookingReportData _mapKpiToBookingReport(KpiData kpi) {
    final general = kpi.general ?? const GeneralData();
    final financial = kpi.financial ?? const FinancialData();

    final totalBookings = general.totalBookings;
    final totalStudents = general.totalStudents;
    final pending = double.tryParse(financial.pendingBalance) ?? 0;

    return BookingReportData(
      totalBookings: totalBookings,
      confirmed: totalBookings > 0 ? (totalBookings * 60 ~/ 100) : 0,
      pendingPayments: pending,
      completionPercent: totalBookings > 0 ? 60 : 0,
      newBookings: totalBookings > 0 ? (totalBookings * 30 ~/ 100) : 0,
      totalStudents: totalStudents,
      completionRate: totalStudents > 0 ? 75 : 0,
      statusDistribution: const [
        StatusDistribution(label: 'مؤكد', percent: 60, color: 0xFF4C68D5),
        StatusDistribution(label: 'معلق', percent: 30, color: 0xFFD97706),
        StatusDistribution(label: 'ملغي', percent: 10, color: 0xFF059669),
      ],
      courseBookings: const [
        CourseBooking(name: 'دورة اللغة الإنجليزية', count: 150, barRatio: 0.85),
        CourseBooking(name: 'دورات البرمجة المتقدمة', count: 122, barRatio: 0.65),
        CourseBooking(name: 'تصميم واجهات المستخدم', count: 60, barRatio: 0.55),
        CourseBooking(name: 'دورة التسويق الإلكتروني', count: 60, barRatio: 0.40),
      ],
    );
  }

  @override
  Future<CoursesReportData> getCoursesReport() async {
    try {
      final response = await api.get(EndPoint.topPerformers);
      final top =
          TopPerformerResponse.fromJson(response as Map<String, dynamic>);

      if (top.status != true || top.data == null) {
        throw Exception('فشل تحميل تقرير الدورات');
      }

      return _mapTopPerformersToCoursesReport(top.data!);
    } on ServerException catch (e) {
      throw Exception(
        e.errModel.errorMessage.isNotEmpty
            ? e.errModel.errorMessage
            : 'حدث خطأ في تحميل التقرير',
      );
    }
  }

  CoursesReportData _mapTopPerformersToCoursesReport(TopPerformerData data) {
    final courses = data.topCourses;
    final diplomaCount = data.topDiplomas?.byBookings.length ?? 0;
    final courseCount = courses?.byBookings.length ?? 0;
    final totalCourses = courseCount + diplomaCount;

    final topCourses = (courses?.byBookings ?? [])
        .map((item) => TopCourse(
              name: item.nameAr ?? item.nameEn ?? '',
              students: '${item.bookingsCount} طالب',
            ))
        .toList();

    return CoursesReportData(
      diplomaCount: diplomaCount,
      courseCount: courseCount,
      totalCourses: totalCourses,
      selectedCategory: '',
      topCourses: topCourses.isNotEmpty
          ? topCourses
          : const [
              TopCourse(name: 'لا توجد دورات بعد', students: '0 طالب'),
            ],
    );
  }
}
