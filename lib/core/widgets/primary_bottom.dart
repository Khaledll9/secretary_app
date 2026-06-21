import 'package:flutter/material.dart';


class PrimaryBottom extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool hasIcon;
  final double height;
  final double elevation;
  final TextStyle textStyle;
  const PrimaryBottom({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.hasIcon = true,
    required this.height,
    this.elevation = 0,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasIcon) Icon(icon, size: 20, color: Theme.of(context).colorScheme.surface),
            const SizedBox(width: 8),
            Text(title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
