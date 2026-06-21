import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import 'dashed_border_painter.dart';

class ImageUploadField extends StatelessWidget {
  final VoidCallback? onTap;

  const ImageUploadField({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: CustomPaint(
          painter: DashedBorderPainter(
            color: Theme.of(context).colorScheme.primaryContainer,
            strokeWidth: 2,
            dashLength: 6,
            gapLength: 4,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.cloud_upload_outlined,
                    size: 18,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'تحميل صورة الدورة',
                  style: AppTextStyles.bold18.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'اضغط لاختيار صورة الغلاف',
                  style: AppTextStyles.regular14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
