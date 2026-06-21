import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/add_booking_provider.dart';

class AttendanceToggle extends StatelessWidget {
  final AttendanceType selectedType;
  final ValueChanged<AttendanceType> onChanged;

  const AttendanceToggle({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'نوع الحضور',
          style: AppTextStyles.medium14.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Expanded(
                child: _ToggleButton(
                  label: 'عن بعد',
                  isSelected: selectedType == AttendanceType.remote,
                  onTap: () => onChanged(AttendanceType.remote),
                ),
              ),
              Expanded(
                child: _ToggleButton(
                  label: 'حضوري',
                  isSelected: selectedType == AttendanceType.inPerson,
                  onTap: () => onChanged(AttendanceType.inPerson),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ToggleButton({
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
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.surface
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: isSelected
                ? AppTextStyles.bold16.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  )
                : AppTextStyles.regular16,
          ),
        ),
      ),
    );
  }
}
