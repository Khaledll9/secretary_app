import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import 'app_dropdown_field.dart';
import 'app_form_field.dart';

class AutoFilledSection extends StatelessWidget {
  final TextEditingController? courseNameController;
  final TextEditingController? departmentController;
  final TextEditingController? originalPriceController;
  final TextEditingController? instructorNameController;
  final ValueChanged<String>? onCourseNameChanged;
  final ValueChanged<String?>? onDepartmentChanged;
  final ValueChanged<String>? onOriginalPriceChanged;
  final ValueChanged<String>? onInstructorNameChanged;

  const AutoFilledSection({
    super.key,
    this.courseNameController,
    this.departmentController,
    this.originalPriceController,
    this.instructorNameController,
    this.onCourseNameChanged,
    this.onDepartmentChanged,
    this.onOriginalPriceChanged,
    this.onInstructorNameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.edit_outlined,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'المعلومات الأساسية',
                style: AppTextStyles.medium14.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          AppFormField(
            fillColor: Theme.of(context).colorScheme.surfaceContainerLowest,
            label: 'اسم الدورة',
            hint: 'مثال: دورة التصميم الجرافيكي',
            controller: courseNameController,
            onChanged: onCourseNameChanged,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'اسم الدورة مطلوب';
              return null;
            },
          ),
          const SizedBox(height: 12),
          AppDropdownField(
            label: 'القسم',
            value: departmentController?.text.isEmpty == true
                ? null
                : departmentController?.text,
            onChanged: onDepartmentChanged,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'القسم مطلوب';
              return null;
            },
            items: const [
              DropdownMenuItem(value: 'حاسوب', child: Text('حاسوب')),
              DropdownMenuItem(value: 'لغات', child: Text('لغات')),
              DropdownMenuItem(value: 'هندسة', child: Text('هندسة')),
            ],
          ),
          const SizedBox(height: 12),
          AppFormField(
            fillColor: Theme.of(context).colorScheme.surfaceContainerLowest,
            label: 'السعر الأصلي',
            hint: '9,000 ر.ي',
            controller: originalPriceController,
            onChanged: onOriginalPriceChanged,
            keyboardType: TextInputType.number,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'السعر الأصلي مطلوب';
              if (double.tryParse(v.replaceAll(RegExp(r'[^0-9.]'), '')) ==
                  null) {
                return 'السعر يجب أن يكون رقماً';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          AppFormField(
            fillColor: Theme.of(context).colorScheme.surfaceContainerLowest,
            label: 'اسم المدرب',
            hint: 'مثال: احمد محمد',
            controller: instructorNameController,
            onChanged: onInstructorNameChanged,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'اسم المدرب مطلوب';
              return null;
            },
          ),
        ],
      ),
    );
  }
}
