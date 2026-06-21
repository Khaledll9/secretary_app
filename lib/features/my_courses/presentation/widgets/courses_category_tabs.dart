import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import '../providers/courses_provider.dart';

const _categories = [
  CourseCategory.all,
  CourseCategory.programming,
  CourseCategory.design,
  CourseCategory.development,
  CourseCategory.entrepreneurship,
  CourseCategory.skills,
];

String _categoryLabel(CourseCategory category) {
  switch (category) {
    case CourseCategory.all:
      return 'الكل';
    case CourseCategory.programming:
      return 'برمجة';
    case CourseCategory.design:
      return 'تصميم';
    case CourseCategory.development:
      return 'تطوير';
    case CourseCategory.entrepreneurship:
      return 'ريادة أعمال';
    case CourseCategory.skills:
      return 'مهارات';
  }
}

class CoursesCategoryTabs extends ConsumerWidget {
  const CoursesCategoryTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeCategory = ref.watch(
      coursesProvider.select((s) => s.selectedCategory),
    );
    final notifier = ref.read(coursesProvider.notifier);

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          children: _categories.map((category) {
            final isActive = category == activeCategory;
            return GestureDetector(
              onTap: () => notifier.selectCategory(category),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                margin: const EdgeInsets.only(left: 32),
                decoration: BoxDecoration(
                  border: isActive
                      ? Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        )
                      : null,
                ),
                child: Text(
                  _categoryLabel(category),
                  style: isActive
                      ? AppTextStyles.bold14.copyWith(color: Theme.of(context).colorScheme.primary)
                      : AppTextStyles.regular14,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
