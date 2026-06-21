import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouterHelper;

import '../../../../core/theme/text_styles.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/view_all_widget.dart';
import '../../domain/entities/my_courses_course.dart';
import 'my_courses_course_item.dart';

class MyCoursesList extends StatelessWidget {
  final List<MyCoursesCourse> courses;

  const MyCoursesList({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('الدورات المتاحة', style: AppTextStyles.bold18),
            InkWell(
              onTap: () => context.pushNamed(AppRoutes.courses),
              child: ViewAllWidget(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (courses.isEmpty)
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 48),
              child: Text(
                'لا توجد دورات متاحة',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ),
          )
        else
          Column(
            children: courses
                .map(
                  (course) => InkWell(
                    onTap: () => context.pushNamed(AppRoutes.courseDetails),
                    child: MyCoursesCourseItem(course: course),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}
