import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/add_course_provider.dart';

class AddCourseBottomActions extends ConsumerWidget {
  const AddCourseBottomActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addCourseProvider);
    final isLoading = state.authState is AddCourseLoading;

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: isLoading
                ? null
                : () => ref.read(addCourseProvider.notifier).submit(),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: isLoading
                    ? Theme.of(context).colorScheme.onPrimaryContainer
                    : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    )
                  : Text(
                      'إضافة',
                      style: AppTextStyles.bold16.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            'معاينة',
            style: AppTextStyles.bold16.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
