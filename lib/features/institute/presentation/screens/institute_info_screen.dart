import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/institute_provider.dart';
import '../widgets/institute_about_section.dart';
import '../widgets/institute_action_buttons.dart';
import '../widgets/institute_cover_section.dart';
import '../widgets/institute_map_widget.dart';
import '../widgets/institute_specialties_section.dart';

class InstituteInfoScreen extends ConsumerWidget {
  const InstituteInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(instituteProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل المعهد', style: AppTextStyles.bold20),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: state.content.when(
        data: (data) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              InstituteCoverSection(name: data.name, address: data.address),
              const SizedBox(height: 180),
              InstituteAboutSection(about: data.about),
              const SizedBox(height: 24),
              InstituteSpecialtiesSection(specialties: data.specialties),
              const SizedBox(height: 24),
              InstituteActionButtons(),
              const SizedBox(height: 24),
              const InstituteMapWidget(),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text(
            'حدث خطأ أثناء تحميل المحتوى',
            style: AppTextStyles.regular14.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
