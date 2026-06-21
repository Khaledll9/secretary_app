import 'package:flutter/material.dart';

import '../../../../../../core/theme/text_styles.dart';

class CoursesFilterSection extends StatelessWidget {
  final String selectedCategory;
  final String totalCourses;
  final ValueChanged<String?> onCategoryChanged;

  const CoursesFilterSection({
    super.key,
    required this.selectedCategory,
    required this.totalCourses,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('تصفية حسب الفئة', style: AppTextStyles.bold14),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _CategoryDropdown(
                selectedCategory: selectedCategory,
                onChanged: onCategoryChanged,
              ),
            ),
            const SizedBox(width: 12),
            _CoursesChip(label: 'عدد الدورات: $totalCourses'),
          ],
        ),
      ],
    );
  }
}

class _CategoryDropdown extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String?> onChanged;

  const _CategoryDropdown({
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsetsDirectional.only(start: 8),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCategory.isEmpty ? null : selectedCategory,
          isExpanded: true,
          hint: Text(
            'حاسوب',
            style: AppTextStyles.regular14.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: Theme.of(context).colorScheme.outline,
          ),
          style: AppTextStyles.regular14.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          items: const [
            DropdownMenuItem(
              value: 'حاسوب',
              child: Text('حاسوب', textAlign: TextAlign.right),
            ),
            DropdownMenuItem(
              value: 'لغات',
              child: Text('لغات', textAlign: TextAlign.right),
            ),
            DropdownMenuItem(
              value: 'هندسة',
              child: Text('هندسة', textAlign: TextAlign.right),
            ),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class _CoursesChip extends StatelessWidget {
  final String label;

  const _CoursesChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: AppTextStyles.bold12),
    );
  }
}
