import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

class CourseDetailsSection extends StatelessWidget {
  final String courseName;
  final String instructorName;
  final String statusLabel;
  final Color statusColor;
  final Color statusBgColor;

  const CourseDetailsSection({
    super.key,
    required this.courseName,
    required this.instructorName,
    this.statusLabel = 'في الانتظار',
    this.statusColor = const Color(0xFF059669),
    this.statusBgColor = const Color(0xFFD1FAE5),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text('تفاصيل الدورة', style: AppTextStyles.bold16),
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(courseName, style: AppTextStyles.bold16),
                  const SizedBox(height: 4),
                  Text(
                    instructorName,
                    style: AppTextStyles.bold14.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  statusLabel,
                  style: AppTextStyles.bold14.copyWith(color: statusColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
