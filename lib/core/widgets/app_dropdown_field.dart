import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class AppDropdownField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final List<DropdownMenuItem<T>> items;
  final String? errorText;
  final String? hint;

  const AppDropdownField({
    super.key,
    required this.label,
    this.value,
    this.onChanged,
    this.validator,
    required this.items,
    this.errorText,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = errorText != null;

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
        DropdownButtonFormField<T>(
          initialValue: value,
          onChanged: onChanged,
          validator: validator,
          isExpanded: true,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hint,
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerLowest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: hasError
                  ? BorderSide(color: theme.colorScheme.error)
                  : BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: hasError
                  ? BorderSide(color: theme.colorScheme.error)
                  : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: hasError ? theme.colorScheme.error : theme.colorScheme.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
            contentPadding: const EdgeInsetsDirectional.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
          ),
          style: AppTextStyles.medium14.copyWith(
            color: theme.colorScheme.onSurface,
          ),
          dropdownColor: theme.colorScheme.surface,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 18,
            color: theme.colorScheme.onSurface,
          ),
          items: items,
        ),
        if (hasError) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: TextStyle(fontSize: 12, color: theme.colorScheme.error),
          ),
        ],
      ],
    );
  }
}
