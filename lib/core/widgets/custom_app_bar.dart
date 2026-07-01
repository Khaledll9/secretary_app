import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;

  const CustomAppBar({super.key, required this.title, this.titleStyle});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      title: Text(
        title,
        style: titleStyle?.copyWith(color: theme.colorScheme.onSurface) ??
            AppTextStyles.bold20.copyWith(color: theme.colorScheme.onSurface),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: theme.colorScheme.onSurface),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
    );
  }
}
