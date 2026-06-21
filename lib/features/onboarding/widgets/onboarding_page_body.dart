import 'package:flutter/material.dart';

import '../../../core/theme/text_styles.dart';
import '../models/onboarding_model.dart';

class OnboardingPageBody extends StatelessWidget {
  final OnboardingModel item;

  const OnboardingPageBody({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(item.contentImage, height: 200),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            item.text,
            textAlign: TextAlign.center,
            style: AppTextStyles.bold18.copyWith(
              color: Theme.of(context).colorScheme.surface,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
