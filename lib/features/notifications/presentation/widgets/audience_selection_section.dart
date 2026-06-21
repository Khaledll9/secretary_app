import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class AudienceSelectionSection extends StatelessWidget {
  final String selectedAudience;
  final ValueChanged<String> onAudienceChanged;

  const AudienceSelectionSection({
    super.key,
    required this.selectedAudience,
    required this.onAudienceChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 118),
            child: Row(
              children: [
                Icon(
                  Icons.people_outline,
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text('تحديد الجمهور', style: AppTextStyles.bold18),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ChipButton(
                label: 'الارسال إلى الكل',
                isActive: selectedAudience == 'all',
                onTap: () => onAudienceChanged('all'),
              ),
              const SizedBox(width: 11),
              _ChipButton(
                label: 'فئة معينة',
                isActive: selectedAudience == 'specific',
                onTap: () => onAudienceChanged('specific'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('عدد المستلمين', style: AppTextStyles.bold14),
                    Row(
                      children: [
                        Text('1,240', style: AppTextStyles.bold14.copyWith(color: Theme.of(context).colorScheme.primary)),
                        Text(
                          ' شخص  سوف يستلم الاعلان',
                          style: AppTextStyles.bold12.copyWith(color: Theme.of(context).colorScheme.outline),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChipButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _ChipButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsetsDirectional.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            textAlign: TextAlign.center,
            label,
            style: isActive
                ? AppTextStyles.bold14.copyWith(color: Theme.of(context).colorScheme.primary)
                : AppTextStyles.medium14.copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
      ),
    );
  }
}
