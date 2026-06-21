import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:secretary_app/core/utils/app_routes.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/reports_provider.dart';
import '../widgets/activity_log_section.dart';
import '../widgets/course_stats_section.dart';
import '../widgets/filter_section.dart';
import '../widgets/stat_grid.dart';

class ReportsScreen extends ConsumerWidget {
  final ScrollController? scrollController;

  const ReportsScreen({super.key, this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reportsProvider);

    return state.content.when(
      data: (data) => SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatGrid(
              title: 'تقارير الإعلانات',
              items: data.adStats,
              onViewAll: () => context.pushNamed(AppRoutes.bookingReport),
            ),
            CourseStatsSection(
              title: 'تقارير الدورات',
              items: data.courseStats,
              onViewAll: () => context.pushNamed(AppRoutes.coursesReports),
            ),
            const SizedBox(height: 16),
            const FilterSection(),
            const SizedBox(height: 16),
            ActivityLogSection(
              title: 'سجل الأنشطة الأخيرة',
              items: data.recentActivities,
            ),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'حدث خطأ أثناء تحميل المحتوى',
                style: AppTextStyles.regular14.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () =>
                    ref.read(reportsProvider.notifier).loadReportsData(),
                child: const Text('إعادة المحاولة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
