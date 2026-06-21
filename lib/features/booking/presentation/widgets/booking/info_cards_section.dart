import 'package:flutter/material.dart';
import 'package:secretary_app/core/theme/text_styles.dart';

import 'info_card.dart';

class InfoCardsSection extends StatelessWidget {
  final String studentName;
  final String courseName;
  final String bookingCode;

  const InfoCardsSection({
    super.key,
    required this.studentName,
    required this.courseName,
    required this.bookingCode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
          child: Text(
            'تفاصيل الحجز الأساسية',
            style: AppTextStyles.bold20.copyWith(color: Theme.of(context).colorScheme.onSurface),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(height: 12),
        InfoCard(
          label: 'اسم الطالب',
          value: studentName,
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(height: 12),
        InfoCard(
          label: 'اسم الدورة',
          icon: Icons.book,
          value: courseName,
          onTap: () {},
        ),
        const SizedBox(height: 12),
        InfoCard(
          label: 'رقم الحجز',
          icon: Icons.numbers,
          value: bookingCode,
          onTap: () {},
        ),
      ],
    );
  }
}
