import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class PasswordRequirementBanner extends StatelessWidget {
  const PasswordRequirementBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل، وتشمل أحرفاً وأرقاماً ورموزاً.',
              style: AppTextStyles.regular14,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
