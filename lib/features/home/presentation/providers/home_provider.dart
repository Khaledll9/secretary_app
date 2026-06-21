import 'package:flutter_riverpod/legacy.dart';

class HomeState {
  final bool isLoading;
  const HomeState({this.isLoading = false});
}

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});
