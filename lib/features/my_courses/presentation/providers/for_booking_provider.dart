import 'package:flutter_riverpod/legacy.dart';

import 'my_courses_provider.dart';

class ForBookingState {
  final MyCoursesFilter selectedFilter;
  const ForBookingState({this.selectedFilter = MyCoursesFilter.all});

  ForBookingState copyWith({MyCoursesFilter? selectedFilter}) {
    return ForBookingState(selectedFilter: selectedFilter ?? this.selectedFilter);
  }
}

class ForBookingNotifier extends StateNotifier<ForBookingState> {
  ForBookingNotifier() : super(const ForBookingState());

  void selectFilter(MyCoursesFilter filter) {
    state = state.copyWith(selectedFilter: filter);
  }
}

final forBookingProvider = StateNotifierProvider<ForBookingNotifier, ForBookingState>((ref) {
  return ForBookingNotifier();
});
