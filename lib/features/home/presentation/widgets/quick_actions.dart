import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _BuildActionCard(
          title: 'إضافة إعلان',
          subtitle: 'إضافة إعلان جديد',
          icon: Icons.add_circle_outline,
          isPrimary: true,
        ),
        const SizedBox(height: 12.0),
        _BuildActionCard(
          title: 'بحث عن طالب',
          subtitle: 'بحث عن تفاصيل حجز الطالب',
          icon: Icons.person_search_outlined,
        ),
        const SizedBox(height: 12.0),
        _BuildActionCard(
          title: 'عرض الدورات',
          subtitle: 'عرض الدورات والدبلومات',
          icon: Icons.school_outlined,
        ),
        const SizedBox(height: 12.0),
        _BuildActionCard(
          title: 'التحصيل المالي',
          subtitle: 'متابعة الرسوم والاشتراكات',
          icon: Icons.monetization_on_outlined,
        ),
      ],
    );
  }
}

class _BuildActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isPrimary;
  const _BuildActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: isPrimary ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: isPrimary
                      ? Theme.of(context).colorScheme.surface.withAlpha(51)
                      : Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: isPrimary ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bold16.copyWith(
                    color: isPrimary ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: AppTextStyles.regular12.copyWith(
                    color: isPrimary
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
