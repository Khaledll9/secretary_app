import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';
import 'package:secretary_app/core/widgets/app_date_field.dart';
import 'package:secretary_app/core/widgets/app_form_field.dart';

class ManualInputSection extends StatelessWidget {
  final TextEditingController? durationController;
  final TextEditingController? maxSeatsController;
  final DateTime? selectedDate;
  final ValueChanged<String>? onDurationChanged;
  final ValueChanged<String>? onMaxSeatsChanged;
  final VoidCallback? onDateTap;

  const ManualInputSection({
    super.key,
    this.durationController,
    this.maxSeatsController,
    this.selectedDate,
    this.onDurationChanged,
    this.onMaxSeatsChanged,
    this.onDateTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppFormField(
          label: 'المدة الزمنية',
          hint: 'مثال: 4 أسابيع',
          controller: durationController,
          onChanged: onDurationChanged,
          prefixIcon: Icons.calendar_today_outlined,
          fillColor: Theme.of(context).colorScheme.surface,
          borderColor: Theme.of(context).colorScheme.surfaceContainer,
          labelStyle: AppTextStyles.medium14.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          hintStyle: AppTextStyles.regular16,
          inputStyle: AppTextStyles.regular16,
        ),
        const SizedBox(height: 16),
        AppDateField(
          label: 'تاريخ انتهاء الإعلان',
          selectedDate: selectedDate,
          onTap: onDateTap,
        ),
        const SizedBox(height: 16),
        AppFormField(
          label: 'أقصى عدد للمقاعد',
          hint: 'مثال: 50',
          controller: maxSeatsController,
          onChanged: onMaxSeatsChanged,
          prefixIcon: Icons.group_outlined,
          fillColor: Theme.of(context).colorScheme.surface,
          borderColor: Theme.of(context).colorScheme.surfaceContainer,
          labelStyle: AppTextStyles.medium14.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          hintStyle: AppTextStyles.regular16,
          inputStyle: AppTextStyles.regular16,
        ),
      ],
    );
  }
}
