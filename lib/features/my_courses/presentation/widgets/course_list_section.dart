import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import '../providers/courses_provider.dart';
import 'course_item_card.dart';
import 'courses_section_header.dart';

class CourseListSection extends ConsumerWidget {
  final ScrollController? scrollController;

  const CourseListSection({super.key, this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(coursesProvider);
    final courses = state.filteredCourses;

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          const CoursesSectionHeader(title: 'الدورات والدبلومات'),
          const SizedBox(height: 16),
          if (courses.isEmpty)
            const _EmptyState()
          else
            Column(
              children: courses
                  .map((course) => CourseItemCard(course: course))
                  .toList(),
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Text(
          'لا توجد دورات متاحة',
          style: AppTextStyles.regular14.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
