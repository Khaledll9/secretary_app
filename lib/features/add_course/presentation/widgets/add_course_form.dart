import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/app_dropdown_field.dart';
import '../../../../core/widgets/app_form_field.dart';
import '../../../../core/widgets/description_field.dart';
import '../providers/add_course_provider.dart';

class AddCourseForm extends ConsumerStatefulWidget {
  const AddCourseForm({super.key});

  @override
  ConsumerState<AddCourseForm> createState() => _AddCourseFormState();
}

class _AddCourseFormState extends ConsumerState<AddCourseForm> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _durationController;
  late TextEditingController _priceController;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addCourseProvider);
    final validation = state.validation;
    final theme = Theme.of(context);

    final fieldStyle = AppTextStyles.medium14.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFormField(
          label: 'عنوان الدورة',
          hint: 'مثال: مقدمة في برمجة بايثون',
          controller: _titleController,
          errorText: validation?.titleArError,
          onChanged: (v) => ref.read(addCourseProvider.notifier).setTitleAr(v),
          fillColor: theme.colorScheme.surface,
          labelStyle: fieldStyle,
          hintStyle: AppTextStyles.regular16,
        ),
        const SizedBox(height: 20),
        AppDropdownField(
          label: 'تصنيف الدورة',
          hint: 'اختر القسم',
          value: state.departmentId > 0 ? state.departmentId : null,
          onChanged: (v) {
            if (v != null) {
              ref.read(addCourseProvider.notifier).setDepartmentId(v);
            }
          },
          errorText: validation?.departmentIdError,
          items: const [
            DropdownMenuItem(value: 1, child: Text('برمجة')),
            DropdownMenuItem(value: 2, child: Text('تصميم')),
            DropdownMenuItem(value: 3, child: Text('تسويق')),
            DropdownMenuItem(value: 4, child: Text('إدارة')),
          ],
        ),
        const SizedBox(height: 20),
        DescriptionField(
          controller: _descriptionController,
          onChanged: (v) =>
              ref.read(addCourseProvider.notifier).setDescriptionAr(v),
        ),
        const SizedBox(height: 20),
        AppFormField(
          label: 'اسم الكورس',
          hint: 'مثال: AI',
          controller: null,
          errorText: validation?.nameArError,
          onChanged: (v) => ref.read(addCourseProvider.notifier).setNameAr(v),
          fillColor: theme.colorScheme.surface,
          labelStyle: fieldStyle,
          hintStyle: AppTextStyles.regular16,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: AppFormField(
                label: 'المدة الزمنية',
                hint: 'مثال: 4 أسابيع',
                suffixIcon: Icons.calendar_today_outlined,
                controller: _durationController,
                errorText: validation?.durationError,
                onChanged: (v) =>
                    ref.read(addCourseProvider.notifier).setDuration(v),
                fillColor: theme.colorScheme.surface,
                labelStyle: fieldStyle,
                hintStyle: AppTextStyles.regular16,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppFormField(
                label: 'السعر',
                hint: '0',
                suffixIcon: Icons.attach_money,
                controller: _priceController,
                errorText: validation?.priceError,
                onChanged: (v) =>
                    ref.read(addCourseProvider.notifier).setPrice(v),
                fillColor: theme.colorScheme.surface,
                labelStyle: fieldStyle,
                hintStyle: AppTextStyles.regular16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: AppFormField(
                label: 'تاريخ البداية',
                hint: 'YYYY-MM-DD',
                controller: null,
                errorText: validation?.startDateError,
                onChanged: (v) =>
                    ref.read(addCourseProvider.notifier).setStartDate(v),
                fillColor: theme.colorScheme.surface,
                labelStyle: fieldStyle,
                hintStyle: AppTextStyles.regular16,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppFormField(
                label: 'تاريخ النهاية',
                hint: 'YYYY-MM-DD',
                controller: null,
                errorText: validation?.endDateError,
                onChanged: (v) =>
                    ref.read(addCourseProvider.notifier).setEndDate(v),
                fillColor: theme.colorScheme.surface,
                labelStyle: fieldStyle,
                hintStyle: AppTextStyles.regular16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _durationController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _durationController = TextEditingController();
    _priceController = TextEditingController();
  }
}
