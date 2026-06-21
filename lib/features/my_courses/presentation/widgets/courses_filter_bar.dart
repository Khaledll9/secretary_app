import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import '../providers/courses_provider.dart';

class CoursesFilterBar extends ConsumerWidget {
  const CoursesFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(coursesProvider);
    final notifier = ref.read(coursesProvider.notifier);

    return Row(
      children: CourseFilter.values.map((filter) {
        final isSelected = state.selectedFilter == filter;
        return Padding(
          padding: EdgeInsets.only(
            left: filter == CourseFilter.values.last ? 0 : 8,
          ),
          child: _FilterChip(
            label: _filterLabel(filter),
            isSelected: isSelected,
            onTap: () => notifier.selectFilter(filter),
          ),
        );
      }).toList(),
    );
  }

  String _filterLabel(CourseFilter filter) {
    switch (filter) {
      case CourseFilter.all:
        return 'الكل';
      case CourseFilter.courses:
        return 'الدورات';
      case CourseFilter.diplomas:
        return 'الدبلومات';
    }
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.medium14.copyWith(
            color: isSelected
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
      ),
    );
  }
}
