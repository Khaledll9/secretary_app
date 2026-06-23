import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/text_styles.dart';
import '../providers/booking_report_provider.dart';
import '../widgets/booking_reports/bar_chart_section.dart';
import '../widgets/booking_reports/booking_status_section.dart';
import '../widgets/booking_reports/report_detail_row.dart';
import '../widgets/booking_reports/report_stat_card.dart';

class BookingReportScreen extends ConsumerWidget {
  const BookingReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('تقارير الحجوزات', style: AppTextStyles.bold20),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SafeArea(
        child: state.content.when(
          data: (data) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.3,
                    children: [
                      ReportStatCard(
                        label: 'إجمالي الحجوزات',
                        value: '${data.totalBookings}',
                        icon: Icons.calendar_today_outlined,
                        iconBgColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainer,
                        iconColor: Theme.of(context).colorScheme.outline,
                      ),
                      ReportStatCard(
                        label: 'مؤكد',
                        value: '${data.confirmed}',
                        icon: Icons.check_circle_outline,
                        iconBgColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        iconColor: Theme.of(context).colorScheme.primary,
                      ),
                      ReportStatCard(
                        label: 'المدفوعات المعلقة',
                        value: '${data.pendingPayments.toInt()}',
                        icon: Icons.account_balance_wallet_outlined,
                        iconBgColor: Theme.of(
                          context,
                        ).colorScheme.surfaceBright,
                        iconColor: Theme.of(context).colorScheme.surfaceDim,
                      ),
                      ReportStatCard(
                        label: 'الإنجاز',
                        value: '%${data.completionPercent}',
                        icon: Icons.trending_up,
                        iconBgColor: Theme.of(
                          context,
                        ).colorScheme.tertiaryContainer,
                        iconColor: Theme.of(context).colorScheme.tertiary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      ReportDetailRow(
                        label: 'الحجوزات الجديدة',
                        value: '${data.newBookings}',
                        icon: Icons.calendar_today_outlined,
                        iconBgColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHighest,
                        iconColor: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 12),
                      ReportDetailRow(
                        label: 'إجمالي الطلاب المسجلين',
                        value: '${data.totalStudents}',
                        icon: Icons.people_outline,
                        iconBgColor: Theme.of(
                          context,
                        ).colorScheme.tertiaryContainer,
                        iconColor: Theme.of(context).colorScheme.tertiary,
                      ),
                      const SizedBox(height: 12),
                      ReportDetailRow(
                        label: 'معدل الإنجاز',
                        value: '%${data.completionRate}',
                        icon: Icons.star_outline,
                        iconBgColor: Theme.of(
                          context,
                        ).colorScheme.onSecondaryFixed,
                        iconColor: Theme.of(context).colorScheme.secondaryFixed,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  BookingStatusSection(items: data.statusDistribution),
                  const SizedBox(height: 16),
                  BarChartSection(items: data.courseBookings),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(
            child: Text(
              'حدث خطأ أثناء تحميل المحتوى',
              style: AppTextStyles.regular14.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
