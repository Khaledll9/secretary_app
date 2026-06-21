import 'package:flutter/material.dart';
import '../../../../core/theme/text_styles.dart';

class AddCourseImageUpload extends StatelessWidget {
  const AddCourseImageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 188,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        // NOTE: For exact dashed border, use the `dotted_border` package.
        // For now, using a solid border representation.
        border: Border.all(
          color: Theme.of(context).colorScheme.primaryFixed,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.cloud_upload_outlined, // Replace with actual SVG
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'تحميل صورة الدورة',
            style: AppTextStyles.bold18.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 4),
          Text(
            'اضغط لاختيار صورة الغلاف',
            style: AppTextStyles.regular14.copyWith(color: Theme.of(context).colorScheme.outline),
          ),
        ],
      ),
    );
  }
}
