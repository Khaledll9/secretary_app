import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import 'onboarding_dot_indicator.dart';

class OnboardingActionCard extends StatelessWidget {
  final int currentIndex;
  final int totalCount;
  final VoidCallback onNext;

  const OnboardingActionCard({
    super.key,
    required this.currentIndex,
    required this.totalCount,
    required this.onNext,
  });

  bool get _isLastPage => currentIndex == totalCount - 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(30, 24, 30, 40),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalCount,
              (index) =>
                  OnboardingDotIndicator(isActive: index == currentIndex),
            ),
          ),
          const SizedBox(height: 35),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              onPressed: onNext,
              child: Text(
                _isLastPage ? "دخول" : "التالي",
                style: AppTextStyles.bold16.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
