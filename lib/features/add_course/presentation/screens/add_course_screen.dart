import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/bottom_action_bar.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/image_upload_field.dart';
import '../../../../core/widgets/toggle_card.dart'
    show ToggleCard, ToggleRowItem;
import '../providers/add_course_provider.dart';
import '../widgets/add_course_form.dart';
import '../widgets/course_snackbar_listener.dart';

class AddCourseScreen extends ConsumerWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CourseSnackBarListener(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'إضافة دورة', titleStyle: AppTextStyles.bold18),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ImageUploadField(),
                    const SizedBox(height: 24),
                    const AddCourseForm(),
                    const SizedBox(height: 24),
                    ToggleCard(
                      items: [
                        ToggleRowItem(
                          title: 'شهادة معتمدة',
                          subtitle: 'يمنح الطالب شهادة عند الإكمال',
                          value: false,
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _BottomActions(ref: ref),
          ],
        ),
      ),
    );
  }
}

class _BottomActions extends ConsumerWidget {
  final WidgetRef ref;

  const _BottomActions({required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef _) {
    final state = ref.watch(addCourseProvider);
    final isLoading = state.authState is AddCourseLoading;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: BottomActionBar(
        mainLabel: 'إضافة',
        secondaryLabel: 'معاينة',
        isLoading: isLoading,
        onMainPressed: () => ref.read(addCourseProvider.notifier).submit(),
        onSecondaryPressed: () {},
      ),
    );
  }
}
