import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class ToggleCard extends StatelessWidget {
  final bool isFree;
  final bool includesCertificate;
  final ValueChanged<bool> onFreeChanged;
  final ValueChanged<bool> onCertificateChanged;

  const ToggleCard({
    super.key,
    required this.isFree,
    required this.includesCertificate,
    required this.onFreeChanged,
    required this.onCertificateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          _ToggleRow(
            title: 'متاح مجانا',
            subtitle: 'للطلاب التسجيل فوراً بدون رسوم',
            value: isFree,
            onChanged: onFreeChanged,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1, color: Theme.of(context).colorScheme.surfaceContainerLowest),
          ),
          _ToggleRow(
            title: 'تتضمن شهادة',
            subtitle: 'يمنح الطالب شهادة عند الإكمال',
            value: includesCertificate,
            onChanged: onCertificateChanged,
          ),
        ],
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleRow({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.medium16),
            const SizedBox(height: 2),
            Text(subtitle, style: AppTextStyles.regular12),
          ],
        ),
        Switch.adaptive(
          value: value,
          onChanged: onChanged,
          activeTrackColor: Theme.of(context).colorScheme.primary,
          trackOutlineColor: WidgetStateProperty.all(
            Theme.of(context).colorScheme.surface,
          ),
          inactiveThumbColor: Theme.of(context).colorScheme.surface,
          inactiveTrackColor: Theme.of(context).colorScheme.surfaceContainer,
        ),
      ],
    );
  }
}
