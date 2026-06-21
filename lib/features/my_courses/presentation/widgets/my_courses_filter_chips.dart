import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/theme.dart';
import '../providers/my_courses_provider.dart';

class MyCoursesFilterChips extends StatelessWidget {
  final MyCoursesFilter selectedFilter;
  final void Function(MyCoursesFilter) onFilterSelected;

  const MyCoursesFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = const [
      _FilterItem(MyCoursesFilter.all, 'الكل'),
      _FilterItem(MyCoursesFilter.diplomas, 'دبلومات'),
      _FilterItem(MyCoursesFilter.courses, 'دورات'),
      _FilterItem(MyCoursesFilter.available, 'متاح للحجز'),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          final isSelected = item.filter == selectedFilter;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () => onFilterSelected(item.filter),
              child: Container(
                padding: AppTheme.filterChipPadding,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surfaceContainerLowest,
                  ),
                ),
                child: Text(
                  item.label,
                  style: AppTextStyles.medium14.copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _FilterItem {
  final MyCoursesFilter filter;
  final String label;

  const _FilterItem(this.filter, this.label);
}
