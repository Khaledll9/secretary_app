import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class AppDropdownField extends StatelessWidget {
  final String label;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;
  final List<DropdownMenuItem<String>> items;

  const AppDropdownField({
    super.key,
    required this.label,
    this.value,
    this.onChanged,
    this.validator,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.regular12.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 4),
        DropdownButtonFormField<String>(
          initialValue: value,
          onChanged: onChanged,
          validator: validator,
          isExpanded: true,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainerLowest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            contentPadding: const EdgeInsetsDirectional.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
          ),
          style: AppTextStyles.medium14.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          dropdownColor: Theme.of(context).colorScheme.surface,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 18,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          items: items,
        ),
      ],
    );
  }
}
