import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/add_course_provider.dart';

class CourseSnackBarListener extends ConsumerStatefulWidget {
  final Widget child;

  const CourseSnackBarListener({super.key, required this.child});

  @override
  ConsumerState<CourseSnackBarListener> createState() =>
      _CourseSnackBarListenerState();
}

class _CourseSnackBarListenerState
    extends ConsumerState<CourseSnackBarListener> {
  @override
  Widget build(BuildContext context) {
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

    return widget.child;
  }
}
