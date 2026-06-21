import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:secretary_app/core/theme/text_styles.dart';
import 'package:secretary_app/core/utils/app_routes.dart';

import '../../../../core/widgets/view_all_widget.dart';
import 'for_booking_course_card.dart';

class MyCoursesAvailableForBooking extends StatelessWidget {
  final List<Map<String, String>> courses;

  const MyCoursesAvailableForBooking({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        SizedBox(
          height: 370,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            itemCount: courses.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final course = courses[index];
              return SizedBox(
                width: 260,
                child: ForBookingCourseCard(
                  title: course['title']!,
                  subTitle: course['subTitle']!,
                    firstButton: _BookingCourseCardButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            size: 16,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'تعديل',
                            style: AppTextStyles.medium14.copyWith(
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ],
                      ),
                    ),
                    secondButton: _StatsButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bar_chart,
                            size: 20,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'إحصائيات',
                            style: AppTextStyles.medium14.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BookingCourseCardButton extends StatelessWidget {
  final Widget child;

  const _BookingCourseCardButton({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class _StatsButton extends StatelessWidget {
  final Widget child;

  const _StatsButton({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
