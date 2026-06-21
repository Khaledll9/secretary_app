import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class InstituteActionButtons extends StatelessWidget {

  const InstituteActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _InstituteButtons(
            label: 'اتصل الآن',
            icon: Icons.phone_outlined,
            bgColor: Theme.of(context).colorScheme.primary,
            textColor: Theme.of(context).colorScheme.surface,
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          _InstituteButtons(
            label: 'واتساب',
            icon: Icons.chat_outlined,
            bgColor: Theme.of(context).colorScheme.tertiary,
            textColor: Theme.of(context).colorScheme.surface,
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          _InstituteButtons(
            label: 'الموقع',
            icon: Icons.location_on_outlined,
            bgColor: Colors.transparent,
            textColor: Theme.of(context).colorScheme.onSurface,
            borderColor: Theme.of(context).colorScheme.onSurface,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _InstituteButtons extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback onPressed;

  const _InstituteButtons({
    required this.label,
    required this.icon,
    required this.bgColor,
    required this.textColor,
    this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          disabledBackgroundColor: bgColor,
          disabledForegroundColor: textColor,
          elevation: 0,
          side: borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: textColor),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.bold16.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
