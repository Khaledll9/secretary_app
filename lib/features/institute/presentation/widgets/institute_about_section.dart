import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class InstituteAboutSection extends StatelessWidget {
  final String about;

  const InstituteAboutSection({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 32,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'نبذة عن المعهد',
                style: AppTextStyles.bold20,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            about,
            style: AppTextStyles.regular14,
          ),
        ],
      ),
    );
  }
}
