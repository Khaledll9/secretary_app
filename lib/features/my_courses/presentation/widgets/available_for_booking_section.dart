import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:secretary_app/core/utils/app_routes.dart';

import '../../../../core/theme/text_styles.dart';
import '../../../../core/widgets/view_all_widget.dart';
import '../../../course_details/presentation/screens/course_details_screen.dart';
import '../../domain/entities/my_courses_course.dart';
import 'available_course_card.dart';

class AvailableForBookingSection extends StatelessWidget {
  final List<MyCoursesCourse> courses;

  const AvailableForBookingSection({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('المتوفرة للحجز', style: AppTextStyles.bold18),
              InkWell(
                onTap: () => context.pushNamed(AppRoutes.forBooking),
                child: ViewAllWidget(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 305,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: courses.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final course = courses[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CourseDetailsScreen(),
                  ),
                ),
                child: AvailableCourseCard(
                  title: course.title,
                  bookingDeadline: _getBookingDeadline(course),
                  onEdit: () {},
                  onStats: () {},
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  static String _getBookingDeadline(MyCoursesCourse course) {
    final deadlines = [
      'يتبقى 4 أيام لإنتهاء الحجز',
      'يتبقى يوم لإنتهاء الحجز',
      'يتبقى يومين لإنتهاء الحجز',
      'يتبقى 3 أيام لإنتهاء الحجز',
      'يتبقى 5 أيام لإنتهاء الحجز',
    ];
    return deadlines[course.id % deadlines.length];
  }
}
