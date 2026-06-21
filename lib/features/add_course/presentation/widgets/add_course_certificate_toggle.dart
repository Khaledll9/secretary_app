import 'package:flutter/material.dart';
import '../../../../core/theme/text_styles.dart';

class AddCourseCertificateToggle extends StatelessWidget {
  const AddCourseCertificateToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('شهادة معتمدة', style: AppTextStyles.medium16.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                const SizedBox(height: 4),
                Text(
                  'يمنح الطالب شهادة عند الإكمال',
                  style: AppTextStyles.regular12.copyWith(color: Theme.of(context).colorScheme.outline),
                ),
              ],
            ),
          ),
          // Custom Toggle Representation
          Container(
            width: 44,
            height: 24,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(9999),
            ),
            alignment: Alignment.centerLeft, // Since it's active in RTL, the knob moves left
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
