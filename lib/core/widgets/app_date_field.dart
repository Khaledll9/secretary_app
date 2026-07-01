import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class AppDateField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final VoidCallback? onTap;

  const AppDateField({
    super.key,
    required this.label,
    this.selectedDate,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.regular12.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: theme.colorScheme.surfaceContainerHigh,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 18,
                  color: theme.colorScheme.outline,
                ),
                const SizedBox(width: 8),
                Text(
                  selectedDate != null
                      ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                      : 'dd/mm/yyyy',
                  style: selectedDate != null
                      ? AppTextStyles.regular14.copyWith(
                          color: theme.colorScheme.onSurface,
                        )
                      : AppTextStyles.regular14.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
