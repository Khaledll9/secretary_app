import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class CourseBottomBar extends StatelessWidget {
  const CourseBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _CourseActionButton(
          text: '????????',
          icon: Icons.bar_chart_rounded,
          backgroundColor: Theme.of(context).colorScheme.primaryFixed,
          textColor: Theme.of(context).colorScheme.onPrimaryContainer,
          textStyle: AppTextStyles.bold14.copyWith(color: Theme.of(context).colorScheme.primary),
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _CourseActionButton(
          text: '??? ??????',
          icon: Icons.delete_outline_rounded,
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          textColor: Theme.of(context).colorScheme.error,
          textStyle: AppTextStyles.medium16.copyWith(color: Theme.of(context).colorScheme.error),
          onTap: () {},
        ),
      ],
    );
  }
}

class _CourseActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle textStyle;
  final VoidCallback onTap;

  const _CourseActionButton({
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.textStyle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: const Size(double.infinity, 48),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(text, style: textStyle),
        ],
      ),
    );
  }
}
