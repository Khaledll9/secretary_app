import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/my_courses_provider.dart';
import '../widgets/available_for_booking_section.dart';
import '../widgets/my_courses_filter_chips.dart';
import '../widgets/my_courses_list.dart';
import '../widgets/my_courses_search_section.dart';

class MyCoursesScreen extends ConsumerWidget {
  final ScrollController? scrollController;

  const MyCoursesScreen({super.key, this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myCoursesState = ref.watch(myCoursesProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              const MyCoursesSearchSection(),
              const SizedBox(height: 12),
              MyCoursesFilterChips(
                selectedFilter: myCoursesState.selectedFilter,
                onFilterSelected: ref
                    .read(myCoursesProvider.notifier)
                    .selectFilter,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: myCoursesState.courses.when(
              data: (courses) {
                final filtered = filterCourses(
                  courses,
                  myCoursesState.selectedFilter,
                );
                final availableForBooking = courses
                    .where((c) => c.isAvailable == true)
                    .take(4)
                    .toList();

                return SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      AvailableForBookingSection(courses: availableForBooking),
                      const SizedBox(height: 24),
                      MyCoursesList(courses: filtered),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: const Text('حدث خطأ أثناء تحميل المحتوى'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
