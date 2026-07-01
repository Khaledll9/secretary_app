import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/text_styles.dart';
import '../../domain/entities/reports_data.dart';
import '../providers/courses_reports_provider.dart';
import '../widgets/courses_reports/courses_filter_section.dart';
import '../widgets/courses_reports/stat_courses_card.dart';
import '../widgets/courses_reports/top_course_item.dart';

class CoursesReportsScreen extends ConsumerWidget {
  const CoursesReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(coursesReportsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('تقارير الدورات', style: AppTextStyles.bold20),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SafeArea(child: _buildBody(context, state, ref)),
    );
  }

  Widget _buildBody(
    BuildContext context,
    CoursesReportsState state,
    WidgetRef ref,
  ) {
    final notifier = ref.read(coursesReportsProvider.notifier);

    return state.content.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                error.toString(),
                style: AppTextStyles.medium16.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => notifier.load(),
                child: const Text('إعادة المحاولة'),
              ),
            ],
          ),
        ),
      ),
      data: (data) => _buildContent(context, data, ref),
    );
  }

  Widget _buildContent(
    BuildContext context,
    CoursesReportData data,
    WidgetRef ref,
  ) {
    final notifier = ref.read(coursesReportsProvider.notifier);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: StatCoursesCard(
                    item: StatItem(
                      label: 'الدبلومات',
                      value: '${data.diplomaCount}',
                      iconBgColor: Theme.of(
                        context,
                      ).colorScheme.onSecondaryFixed,
                      iconColor: Theme.of(context).colorScheme.secondaryFixed,
                      iconType: IconType.diploma,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StatCoursesCard(
                    item: StatItem(
                      label: 'الدورات',
                      value: '${data.courseCount}',
                      iconBgColor: Theme.of(context).colorScheme.surfaceBright,
                      iconColor: Theme.of(context).colorScheme.surfaceDim,
                      iconType: IconType.course,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoursesFilterSection(
                    selectedCategory: data.selectedCategory,
                    totalCourses: '${data.totalCourses}',
                    onCategoryChanged: (v) {
                      if (v != null) notifier.setCategory(v);
                    },
                  ),
                  const SizedBox(height: 16),
                  Text('الدورات الأعلى طلبًا', style: AppTextStyles.bold16),
                  ...data.topCourses.map(
                    (course) => Column(
                      children: [
                        TopCourseItem(
                          courseName: course.name,
                          studentCount: course.students,
                        ),
                        Divider(
                          height: 1,
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
