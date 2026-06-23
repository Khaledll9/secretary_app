import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouterHelper;

import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_routes.dart';

class ForBookingCourseCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget firstButton;
  final Widget secondButton;

  const ForBookingCourseCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.firstButton,
    required this.secondButton,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.courseDetails);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.outlineVariant.withAlpha(20),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/course1.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                top: 12,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.bold16),
                  const SizedBox(height: 8),
                  Text(
                    subTitle,
                    style: AppTextStyles.regular14.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: firstButton),
                      const SizedBox(width: 12.0),
                      Expanded(child: secondButton),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
