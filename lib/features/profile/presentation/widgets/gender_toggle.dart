import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class GenderToggle extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String> onChanged;

  const GenderToggle({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الجنس', style: AppTextStyles.medium14.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              _GenderButton(
                label: 'ذكر',
                isSelected: selectedGender == 'male',
                onTap: () => onChanged('male'),
              ),
              const SizedBox(width: 8),
              _GenderButton(
                label: 'أنثى',
                isSelected: selectedGender == 'female',
                onTap: () => onChanged('female'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GenderButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).colorScheme.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              label,
              style: isSelected
                  ? AppTextStyles.bold16.copyWith(color: Theme.of(context).colorScheme.primary)
                  : AppTextStyles.medium16,
            ),
          ),
        ),
      ),
    );
  }
}
