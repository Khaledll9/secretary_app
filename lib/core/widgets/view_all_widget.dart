import 'package:flutter/material.dart';

import '../theme/text_styles.dart';

class ViewAllWidget extends StatelessWidget {
  const ViewAllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('عرض الكل', style: AppTextStyles.bold12),
        const SizedBox(width: 4),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 12,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
