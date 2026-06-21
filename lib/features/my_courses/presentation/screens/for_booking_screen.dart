import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/for_booking_provider.dart';
import '../widgets/for_booking_course_card.dart';
import '../widgets/my_courses_filter_chips.dart';

class ForBookingScreen extends ConsumerWidget {
  const ForBookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(forBookingProvider).selectedFilter;

    final List<Map<String, String>> dummyCourses = [
      {
        'title': 'دورة تصميم واجهات المستخدم UI/UX الشاملة',
        'subTitle': 'يتبقى 4 ايام لإنتهاء الحجز',
      },
      {
        'title': 'أساسيات البرمجة بلغة بايثون للمبتدئين',
        'subTitle': 'يتبقى يوم لإنتهاء الحجز',
      },
      {
        'title': 'استراتيجيات التسويق الرقمي الحديثة',
        'subTitle': 'يتبقى يومين لإنتهاء الحجز',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('المتاح للحجز', style: AppTextStyles.bold20),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Theme.of(context).colorScheme.outline,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: MyCoursesFilterChips(
              selectedFilter: filterState,
              onFilterSelected: (filter) =>
                  ref.read(forBookingProvider.notifier).selectFilter(filter),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: dummyCourses.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16.0),
                itemBuilder: (context, index) {
                  final course = dummyCourses[index];
                  return ForBookingCourseCard(
                    title: course['title']!,
                    subTitle: course['subTitle']!,
                    firstButton: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            size: 20,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            'تعديل',
                            style: AppTextStyles.medium14.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    secondButton: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bar_chart,
                            size: 20,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            'إحصائيات',
                            style: AppTextStyles.medium14.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
