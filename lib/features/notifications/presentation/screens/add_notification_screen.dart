import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/add_notification_provider.dart';
import '../widgets/audience_selection_section.dart';
import '../widgets/content_creation_section.dart';

class AddNotificationScreen extends ConsumerWidget {
  const AddNotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addNotificationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة إشعار جديد', style: AppTextStyles.bold20),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Theme.of(context).colorScheme.outline,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AudienceSelectionSection(
              selectedAudience: state.data.audienceType,
              onAudienceChanged: (type) => ref
                  .read(addNotificationProvider.notifier)
                  .setAudienceType(type),
            ),
            const SizedBox(height: 12),
            ContentCreationSection(
              title: state.data.title,
              body: state.data.body,
              onTitleChanged: (v) =>
                  ref.read(addNotificationProvider.notifier).setTitle(v),
              onBodyChanged: (v) =>
                  ref.read(addNotificationProvider.notifier).setBody(v),
              onAddImage: () =>
                  ref.read(addNotificationProvider.notifier).toggleImage(),
              onAddFile: () =>
                  ref.read(addNotificationProvider.notifier).toggleFile(),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: state.submitState.isLoading
                      ? null
                      : () =>
                            ref.read(addNotificationProvider.notifier).submit(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    disabledBackgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: state.submitState.isLoading
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
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.send_rounded,
                              size: 20,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'إرسال الإشعار الآن',
                              style: AppTextStyles.bold16.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
