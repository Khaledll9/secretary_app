import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/text_styles.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputField(
          label: 'عنوان الدورة',
          hint: 'مثال: مقدمة في برمجة بايثون',
          controller: _titleController,
          errorText: validation?.titleArError,
          onChanged: (v) => ref.read(addCourseProvider.notifier).setTitleAr(v),
        ),
        const SizedBox(height: 20),
        _buildDropdownField(
          label: 'تصنيف الدورة',
          hint: 'اختر القسم',
          value: state.departmentId > 0 ? state.departmentId : null,
          onChanged: (v) {
            if (v != null) {
              ref.read(addCourseProvider.notifier).setDepartmentId(v);
            }
          },
          errorText: validation?.departmentIdError,
        ),
        const SizedBox(height: 20),
        _buildInputField(
          label: 'الوصف',
          hint: 'اكتب وصفاً مختصراً لمحتوى الدورة...',
          maxLines: 4,
          height: 120,
          controller: _descriptionController,
          onChanged: (v) =>
              ref.read(addCourseProvider.notifier).setDescriptionAr(v),
        ),
        const SizedBox(height: 20),
        _buildInputField(
          label: 'اسم الكورس',
          hint: 'مثال: AI',
          controller: null,
          errorText: validation?.nameArError,
          onChanged: (v) => ref.read(addCourseProvider.notifier).setNameAr(v),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildInputField(
                label: 'المدة الزمنية',
                hint: 'مثال: 4 أسابيع',
                suffixIcon: Icons.calendar_today_outlined,
                controller: _durationController,
                errorText: validation?.durationError,
                onChanged: (v) =>
                    ref.read(addCourseProvider.notifier).setDuration(v),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildInputField(
                label: 'السعر',
                hint: '0',
                suffixIcon: Icons.attach_money,
                controller: _priceController,
                errorText: validation?.priceError,
                onChanged: (v) =>
                    ref.read(addCourseProvider.notifier).setPrice(v),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildInputField(
                label: 'تاريخ البداية',
                hint: 'YYYY-MM-DD',
                controller: null,
                errorText: validation?.startDateError,
                onChanged: (v) =>
                    ref.read(addCourseProvider.notifier).setStartDate(v),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildInputField(
                label: 'تاريخ النهاية',
                hint: 'YYYY-MM-DD',
                controller: null,
                errorText: validation?.endDateError,
                onChanged: (v) =>
                    ref.read(addCourseProvider.notifier).setEndDate(v),
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

  Widget _buildDropdownField({
    required String label,
    required String hint,
    int? value,
    required ValueChanged<int?> onChanged,
    String? errorText,
  }) {
    final hasError = errorText != null;

    final departments = [
      {'id': 1, 'name': 'برمجة'},
      {'id': 2, 'name': 'تصميم'},
      {'id': 3, 'name': 'تسويق'},
      {'id': 4, 'name': 'إدارة'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.medium14.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: hasError
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.surfaceContainer,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: value,
              hint: Text(hint, style: AppTextStyles.medium16),
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).colorScheme.outline,
              ),
              items: departments.map((dept) {
                return DropdownMenuItem<int>(
                  value: dept['id'] as int,
                  child: Text(
                    dept['name'] as String,
                    style: AppTextStyles.medium16,
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 4),
          Text(
            errorText,
            style: AppTextStyles.medium16
                .copyWith(color: Theme.of(context).colorScheme.error)
                .copyWith(fontSize: 12),
          ),
        ],
      ],
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    int maxLines = 1,
    double? height,
    IconData? suffixIcon,
    TextEditingController? controller,
    String? errorText,
    required ValueChanged<String> onChanged,
  }) {
    final hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.medium14.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: height,
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.regular16,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              suffixIcon: suffixIcon != null
                  ? Icon(
                      suffixIcon,
                      color: Theme.of(context).colorScheme.outline,
                      size: 20,
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: hasError
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.surfaceContainer,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: hasError
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 4),
          Text(
            errorText,
            style: AppTextStyles.medium16
                .copyWith(color: Theme.of(context).colorScheme.error)
                .copyWith(fontSize: 12),
          ),
        ],
      ],
    );
  }
}
