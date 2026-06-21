import 'package:flutter/material.dart';

import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/institute_data.dart';



class InstituteSpecialtiesSection extends StatelessWidget {
  final List<Specialty> specialties;

  const InstituteSpecialtiesSection({super.key, required this.specialties});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'التخصصات المتاحة',
          style: AppTextStyles.bold20,
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 18),
        ...specialties.map(
          (s) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _SpecialtyCard(specialty: s),
          ),
        ),
      ],
    );
  }
}



class _SpecialtyCard extends StatelessWidget {
  final Specialty specialty;

  const _SpecialtyCard({required this.specialty});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsetsDirectional.all(16),
      child: Row(
        children: [
           Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Color(specialty.iconBgColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                _iconFor(specialty.title),
                size: 20,
                color: Color(specialty.iconColor),
              ),
            ),
          ),
           const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                specialty.title,
                style: AppTextStyles.bold16,
              ),
              Text(
                specialty.subtitle,
                style: AppTextStyles.regular14.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ],
          ),
         
         
        ],
      ),
    );
  }

  IconData _iconFor(String title) {
    switch (title) {
      case 'البرمجيات':
        return Icons.code_outlined;
      case 'اللغات':
        return Icons.language_outlined;
      case 'إدارة الأعمال':
        return Icons.business_center_outlined;
      case 'التصميم الرقمي':
        return Icons.palette_outlined;
      default:
        return Icons.star_outline;
    }
  }
}
