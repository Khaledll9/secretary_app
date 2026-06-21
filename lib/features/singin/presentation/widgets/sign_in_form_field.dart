import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class SignInFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? suffixWidget;
  final bool obscureText;
  final String? errorText;
  final ValueChanged<String> onChanged;

  const SignInFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.suffixWidget,
    this.obscureText = false,
    this.errorText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 0),
          child: Text(label, style: AppTextStyles.medium14.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 17, 17),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: hasError
                ? Border.all(color: Theme.of(context).colorScheme.error, width: 1)
                : null,
          ),
          child: Row(
            children: [
              Icon(prefixIcon, size: 20, color: Theme.of(context).colorScheme.outline),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  onChanged: onChanged,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isCollapsed: true,
                    hintText: hintText,
                    hintStyle: AppTextStyles.regular16,
                  ),
                  style: AppTextStyles.medium16,
                ),
              ),
              ?suffixWidget,
            ],
          ),
        ),
      ],
    );
  }
}
