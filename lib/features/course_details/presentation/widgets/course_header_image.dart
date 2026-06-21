import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'course_info_content.dart';

class CourseDetailsBody extends ConsumerWidget {
  const CourseDetailsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 320,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            // Placeholder for the actual background image
            image: DecorationImage(
              image: AssetImage('assets/images/course1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Edit Button
                  // Back Button
                  _CourseHeaderIconButton(
                    icon: Icons
                        .arrow_back_ios_new, // For RTL back button, adjust if needed
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  _CourseHeaderIconButton(
                    icon: Icons.edit_outlined,
                    onTap: () {
                      // TODO: Implement edit action
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 296),
          child: const CourseInfoContent(),
        ),
      ],
    );
  }
}

class _CourseHeaderIconButton extends StatelessWidget {
  final IconData icon;

  final VoidCallback onTap;
  const _CourseHeaderIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20)),
      ),
    );
  }
}
