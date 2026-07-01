import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/add_course_provider.dart';
import '../widgets/add_course_bottom_actions.dart';
import '../widgets/add_course_certificate_toggle.dart';
import '../widgets/add_course_form.dart';
import '../widgets/add_course_image_upload.dart';

class AddCourseScreen extends ConsumerWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(addCourseProvider);

    ref.listen<AddCourseState>(addCourseProvider, (prev, next) {
      final status = next.authState;
      if (status is AddCourseSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم إضافة الكورس "${status.course.titleAr}" بنجاح'),
            backgroundColor: Theme.of(context).colorScheme.tertiary,
          ),
        );
        ref.read(addCourseProvider.notifier).reset();
      } else if (status is AddCourseError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(status.message),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'إضافة دورة',
          style: AppTextStyles.bold18.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  AddCourseImageUpload(),
                  SizedBox(height: 24),
                  AddCourseForm(),
                  SizedBox(height: 24),
                  AddCourseCertificateToggle(),
                  SizedBox(height: 24),
                  AddCourseBottomActions(),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
