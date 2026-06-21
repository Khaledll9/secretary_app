import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repositories/notification_repository_impl.dart';
import '../../domain/entities/notification_data.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../domain/usecases/get_notifications.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return const NotificationRepositoryImpl();
});

final getNotificationsUseCaseProvider = Provider<GetNotifications>((ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return GetNotifications(repository);
});

final notificationProvider = StateNotifierProvider<NotificationNotifier, NotificationState>((ref) {
  final getNotifications = ref.watch(getNotificationsUseCaseProvider);
  return NotificationNotifier(getNotifications);
});

class NotificationNotifier extends StateNotifier<NotificationState> {
  final GetNotifications _getNotifications;

  NotificationNotifier(this._getNotifications) : super(const NotificationState()) {
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    state = state.copyWith(content: const AsyncValue.loading());
    try {
      final data = await _getNotifications();
      state = state.copyWith(content: AsyncValue.data(data));
    } catch (error, stackTrace) {
      state = state.copyWith(content: AsyncValue.error(error, stackTrace));
    }
  }
}

class NotificationState {
  final AsyncValue<List<NotificationData>> content;

  const NotificationState({
    this.content = const AsyncValue.loading(),
  });

  NotificationState copyWith({
    AsyncValue<List<NotificationData>>? content,
  }) {
    return NotificationState(
      content: content ?? this.content,
    );
  }
}
