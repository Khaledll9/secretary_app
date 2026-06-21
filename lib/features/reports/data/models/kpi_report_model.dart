import 'package:json_annotation/json_annotation.dart';

part 'kpi_report_model.g.dart';

@JsonSerializable(createToJson: false)
class KpiReportResponse {
  final bool status;
  final String? message;
  final KpiData? data;
  final Map<String, dynamic>? errors;

  const KpiReportResponse({
    required this.status,
    this.message,
    this.data,
    this.errors,
  });

  factory KpiReportResponse.fromJson(Map<String, dynamic> json) =>
      _$KpiReportResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class KpiData {
  final GeneralData? general;
  final FinancialData? financial;

  const KpiData({this.general, this.financial});

  factory KpiData.fromJson(Map<String, dynamic> json) =>
      _$KpiDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class GeneralData {
  @JsonKey(name: 'total_courses')
  final int totalCourses;
  @JsonKey(name: 'total_diplomas')
  final int totalDiplomas;
  @JsonKey(name: 'total_advertisements')
  final int totalAdvertisements;
  @JsonKey(name: 'total_students')
  final int totalStudents;
  @JsonKey(name: 'total_bookings')
  final int totalBookings;

  const GeneralData({
    this.totalCourses = 0,
    this.totalDiplomas = 0,
    this.totalAdvertisements = 0,
    this.totalStudents = 0,
    this.totalBookings = 0,
  });

  factory GeneralData.fromJson(Map<String, dynamic> json) =>
      _$GeneralDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class FinancialData {
  @JsonKey(name: 'total_revenue')
  final String totalRevenue;
  @JsonKey(name: 'total_commission_paid')
  final String totalCommissionPaid;
  @JsonKey(name: 'pending_balance')
  final String pendingBalance;

  const FinancialData({
    this.totalRevenue = '0',
    this.totalCommissionPaid = '0',
    this.pendingBalance = '0',
  });

  factory FinancialData.fromJson(Map<String, dynamic> json) =>
      _$FinancialDataFromJson(json);
}
