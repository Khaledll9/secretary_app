import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/course_header_image.dart';

class CourseDetailsScreen extends ConsumerWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Column(children: [CourseDetailsBody()]),
      ),
    );
  }
}
