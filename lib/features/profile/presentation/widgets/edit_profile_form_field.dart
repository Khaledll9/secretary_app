import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class EditProfileFormField extends StatelessWidget {
  final String label;
  final String initialValue;
  final IconData prefixIcon;
  final ValueChanged<String> onChanged;

  const EditProfileFormField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.prefixIcon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 0),
          child: Text(label, style: AppTextStyles.regular14.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 17, 17),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            onChanged: onChanged,
            controller:
                TextEditingController.fromValue(
                    TextEditingValue(text: initialValue),
                  )
                  ..selection = TextSelection.collapsed(
                    offset: initialValue.length,
                  ),
            decoration:  InputDecoration(
            prefixIcon: Icon(prefixIcon, color: Theme.of(context).colorScheme.outline),
              border: InputBorder.none,
              isCollapsed: true,
            ),
            style: AppTextStyles.regular16.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)
          ),
        ),
      ],
    );
  }
}
