import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class PasswordFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final VoidCallback onToggleVisibility;
  final ValueChanged<String> onChanged;

  const PasswordFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.obscureText,
    required this.onToggleVisibility,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 0),
          child: Text(
            label,
            style: AppTextStyles.regular14.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsetsDirectional.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
              suffix: InkWell(
                onTap: onToggleVisibility,
                child: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 24,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              border: InputBorder.none,
              isCollapsed: true,
              hintText: hintText,
              hintStyle: AppTextStyles.regular16,
            ),
            style: AppTextStyles.medium16.copyWith(
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
          ),
        ),
      ],
    );
  }
}
