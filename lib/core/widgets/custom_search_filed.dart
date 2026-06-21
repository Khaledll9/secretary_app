import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class CustomSearchFiled extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  const CustomSearchFiled({
    super.key,
    required this.hintText,
    required this.icon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.regular14,
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(icon, color: Theme.of(context).colorScheme.outline, size: 20),
          ),
        ),
        style: AppTextStyles.medium16.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        onChanged: onChanged,
      ),
    );
  }
}
