import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedFiltersNotifierProvider = NotifierProvider<SelectedFiltersNotifier, Set<String>>(() => SelectedFiltersNotifier());

class SelectedFiltersNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return {};
  }

  void toggleFilter(String filter) {
    if (state.contains(filter)) {
      state = {...state}..remove(filter);
    } else {
      state = {...state}..add(filter);
    }
  }
}
