import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repositories/add_notification_repository_impl.dart';
import '../../domain/entities/add_notification_data.dart';
import '../../domain/repositories/add_notification_repository.dart';
import '../../domain/usecases/send_notification.dart';

final addNotificationProvider =
    StateNotifierProvider<AddNotificationNotifier, AddNotificationState>((ref) {
      final sendNotification = ref.watch(sendNotificationUseCaseProvider);
      return AddNotificationNotifier(sendNotification);
    });

final addNotificationRepositoryProvider = Provider<AddNotificationRepository>((
  ref,
) {
  return const AddNotificationRepositoryImpl();
});

final sendNotificationUseCaseProvider = Provider<SendNotification>((ref) {
  final repository = ref.watch(addNotificationRepositoryProvider);
  return SendNotification(repository);
});

class AddNotificationNotifier extends StateNotifier<AddNotificationState> {
  final SendNotification _sendNotification;

  AddNotificationNotifier(this._sendNotification)
    : super(const AddNotificationState());

  void setAudienceType(String type) {
    state = state.copyWith(data: state.data.copyWith(audienceType: type));
  }

  void setBody(String body) {
    state = state.copyWith(data: state.data.copyWith(body: body));
  }

  void setTitle(String title) {
    state = state.copyWith(data: state.data.copyWith(title: title));
  }

  Future<void> submit() async {
    state = state.copyWith(submitState: const AsyncValue.loading());
    try {
      final success = await _sendNotification(state.data);
      state = state.copyWith(submitState: AsyncValue.data(success));
    } catch (error, stackTrace) {
      state = state.copyWith(submitState: AsyncValue.error(error, stackTrace));
    }
  }

  void toggleFile() {
    state = state.copyWith(
      data: state.data.copyWith(hasFile: !state.data.hasFile),
    );
  }

  void toggleImage() {
    state = state.copyWith(
      data: state.data.copyWith(hasImage: !state.data.hasImage),
    );
  }
}

class AddNotificationState {
  final AddNotificationData data;
  final AsyncValue<bool> submitState;

  const AddNotificationState({
    this.data = const AddNotificationData(),
    this.submitState = const AsyncValue.data(false),
  });

  AddNotificationState copyWith({
    AddNotificationData? data,
    AsyncValue<bool>? submitState,
  }) {
    return AddNotificationState(
      data: data ?? this.data,
      submitState: submitState ?? this.submitState,
    );
  }
}
