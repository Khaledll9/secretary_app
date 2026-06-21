import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class DescriptionField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const DescriptionField({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'الوصف',
          style: AppTextStyles.medium14.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
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
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 84),
          ),
          style: AppTextStyles.regular16,
        ),
      ],
    );
  }
}
