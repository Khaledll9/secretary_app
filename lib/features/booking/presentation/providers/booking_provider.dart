import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:secretary_app/core/api/api_provider.dart';
import '../../data/repositories/booking_repository_impl.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/repositories/booking_repository.dart';

enum BookingFilter { all, pending, confirmed, cancelled, awaiting }

class BookingState {
  final List<BookingEntity> bookings;
  final BookingFilter activeFilter;
  final bool isLoading;

  const BookingState({
    this.bookings = const [],
    this.activeFilter = BookingFilter.all,
    this.isLoading = false,
  });

  BookingState copyWith({
    List<BookingEntity>? bookings,
    BookingFilter? activeFilter,
    bool? isLoading,
  }) {
    return BookingState(
      bookings: bookings ?? this.bookings,
      activeFilter: activeFilter ?? this.activeFilter,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  List<BookingEntity> get filteredBookings {
    if (activeFilter == BookingFilter.all) return bookings;
    if (activeFilter == BookingFilter.awaiting) {
      return bookings.where((b) => b.status == BookingStatus.pending).toList();
    }
    return bookings
        .where((b) => b.status.name == activeFilter.name)
        .toList();
  }
}

class BookingNotifier extends StateNotifier<BookingState> {
  final BookingRepository _repository;

  BookingNotifier(this._repository) : super(const BookingState()) {
    loadBookings();
  }

  Future<void> loadBookings() async {
    state = state.copyWith(isLoading: true);
    try {
      final bookings = await _repository.getBookings();
      state = state.copyWith(bookings: bookings, isLoading: false);
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  void setFilter(BookingFilter filter) {
    state = state.copyWith(activeFilter: filter);
  }
}

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  final api = ref.watch(apiConsumerProvider);
  return BookingRepositoryImpl(api: api);
});

final bookingProvider =
    StateNotifierProvider<BookingNotifier, BookingState>((ref) {
  final repository = ref.watch(bookingRepositoryProvider);
  return BookingNotifier(repository);
});
