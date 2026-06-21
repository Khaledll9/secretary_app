import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import 'course_bottom_bar.dart';
import 'course_highlights_grid.dart';

class CourseInfoContent extends StatelessWidget {
  const CourseInfoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 32, bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _TitleSection(),
          const SizedBox(height: 28),
          const CourseHighlightsGrid(),
          const SizedBox(height: 28),
          const _AboutSection(),
          const SizedBox(height: 28),
          CourseBottomBar(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 6,
              height: 24,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.all(Radius.circular(9999)),
              ),
            ),
            const SizedBox(width: 8),
            Text('عن الدورة', style: AppTextStyles.bold18),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'انضم إلى رحلة احترافية في عالم التصميم الجرافيكي المتقدم. ستتعلم في هذه الدورة كيفية تحويل الأفكار المعقدة إلى تصاميم بصرية مبهرة باستخدام أحدث التقنيات والأدوات العالمية.',
          style: AppTextStyles.regular14,
        ),
        const SizedBox(height: 12),
        Text(
          'تغطي الدورة مفاهيم الهوية البصرية، تصميم تجربة المستخدم، والتعامل الاحترافي مع برامج Adobe. صممت الدورة لتناسب الطامحين للعمل في الوكالات الإبداعية الكبرى.',
          style: AppTextStyles.regular14,
        ),
      ],
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('دورة التصميم الجرافيكي المتقدمة', style: AppTextStyles.bold20),
        const SizedBox(height: 4),
        Text(
          'الاستاذ: محمد احمد',
          style: AppTextStyles.bold14.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onInverseSurface,
                image: DecorationImage(
                  image: AssetImage('assets/images/app_icon_white.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text('معهد يسر للتدريب', style: AppTextStyles.bold16),
          ],
        ),
      ],
    );
  }
}
