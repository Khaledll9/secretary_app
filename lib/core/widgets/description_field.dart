import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const DescriptionField({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'الوصف',
          style: AppTextStyles.medium14.copyWith(
            color: theme.colorScheme.onSurface,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          textAlign: TextAlign.right,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'اكتب وصفاً مختصراً لمحتوى الدورة...',
            hintStyle: AppTextStyles.regular16,
            filled: true,
            fillColor: theme.colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.colorScheme.surfaceContainer),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.colorScheme.surfaceContainer),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.colorScheme.primary),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          style: AppTextStyles.regular16,
        ),
      ],
    );
  }
}
