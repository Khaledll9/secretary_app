import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:secretary_app/core/utils/app_routes.dart';

import '../../../../core/theme/text_styles.dart';
import '../providers/notification_provider.dart';
import '../widgets/notification_card.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('الإشعارات', style: AppTextStyles.bold20),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Theme.of(context).colorScheme.outline,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit_notifications_outlined,
              size: 20,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Theme.of(context).colorScheme.surfaceContainer),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.search, color: Theme.of(context).colorScheme.outline),
                  const SizedBox(width: 8),
                  Text(
                    'البحث عن إشعار بالعنوان...',
                    style: AppTextStyles.regular16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: state.content.when(
                data: (notifications) => ListView(
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'الإشعارات المرسلة مؤخراً',
                      style: AppTextStyles.bold14.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...notifications.map(
                      (n) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: NotificationCard(notification: n),
                      ),
                    ),
                  ],
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Center(
                  child: Text(
                    'حدث خطأ أثناء تحميل المحتوى',
                    style: AppTextStyles.regular14.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRoutes.addNotification);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
      ),
    );
  }
}
