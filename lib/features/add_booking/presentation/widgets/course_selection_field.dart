import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class CourseSelectionField extends StatelessWidget {
  final String? selectedCourse;
  final ValueChanged<String?> onChanged;

  const CourseSelectionField({
    super.key,
    this.selectedCourse,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'اختر الدورة المرتبطة',
          style: AppTextStyles.medium14.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
          ),
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCourse,
              hint: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'ابحث عن دورة موجودة...',
                    style: AppTextStyles.medium16.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ],
              ),
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: Theme.of(context).colorScheme.outline,
              ),
              style: AppTextStyles.regular14.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),

              items: [
                DropdownMenuItem(
                  value: 'course1',
                  child: Text(
                    'دورة التصميم الجرافيكي',
                    style: AppTextStyles.regular14.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'course2',
                  child: Text(
                    'اللغة الإنجليزية - المستوى 1',
                    style: AppTextStyles.regular14.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'course3',
                  child: Text(
                    'برمجة تطبيقات الويب',
                    style: AppTextStyles.regular14.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
