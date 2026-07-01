import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color fillColor;
  final Color? borderColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  final int? maxLines;
  final double? height;
  final String? errorText;

  const AppFormField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    required this.fillColor,
    this.borderColor,
    this.labelStyle,
    this.hintStyle,
    this.inputStyle,
    this.maxLines,
    this.height,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = errorText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle ?? TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: theme.colorScheme.onSurfaceVariant)),
        const SizedBox(height: 4),
        SizedBox(
          height: height,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            keyboardType: keyboardType,
            validator: validator,
            maxLines: maxLines,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: hint,
              hintStyle: hintStyle ?? TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: theme.colorScheme.outline),
              filled: true,
              fillColor: fillColor,
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, size: 20, color: theme.colorScheme.outline)
                  : null,
              suffixIcon: suffixIcon != null
                  ? Icon(suffixIcon, size: 20, color: theme.colorScheme.outline)
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: hasError
                    ? BorderSide(color: theme.colorScheme.error)
                    : borderColor != null
                        ? BorderSide(color: borderColor!)
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
              contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
            ),
            style: inputStyle ?? TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: theme.colorScheme.onSurface),
          ),
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
