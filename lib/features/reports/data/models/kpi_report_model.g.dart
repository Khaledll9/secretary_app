// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kpi_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KpiReportResponse _$KpiReportResponseFromJson(Map<String, dynamic> json) =>
    KpiReportResponse(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : KpiData.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] as Map<String, dynamic>?,
    );

KpiData _$KpiDataFromJson(Map<String, dynamic> json) => KpiData(
  general: json['general'] == null
      ? null
      : GeneralData.fromJson(json['general'] as Map<String, dynamic>),
  financial: json['financial'] == null
      ? null
      : FinancialData.fromJson(json['financial'] as Map<String, dynamic>),
);

GeneralData _$GeneralDataFromJson(Map<String, dynamic> json) => GeneralData(
  totalCourses: (json['total_courses'] as num?)?.toInt() ?? 0,
  totalDiplomas: (json['total_diplomas'] as num?)?.toInt() ?? 0,
  totalAdvertisements: (json['total_advertisements'] as num?)?.toInt() ?? 0,
  totalStudents: (json['total_students'] as num?)?.toInt() ?? 0,
  totalBookings: (json['total_bookings'] as num?)?.toInt() ?? 0,
);

FinancialData _$FinancialDataFromJson(Map<String, dynamic> json) =>
    FinancialData(
      totalRevenue: json['total_revenue'] as String? ?? '0',
      totalCommissionPaid: json['total_commission_paid'] as String? ?? '0',
      pendingBalance: json['pending_balance'] as String? ?? '0',
    );
