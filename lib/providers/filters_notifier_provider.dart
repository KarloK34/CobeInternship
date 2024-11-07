import 'package:flutter_riverpod/flutter_riverpod.dart';

final filtersNotifierProvider = NotifierProvider<FiltersNotifier, Set<String>>(() => FiltersNotifier());

class FiltersNotifier extends Notifier<Set<String>> {
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

  bool isSelected(String filter) {
    return state.contains(filter);
  }
}
