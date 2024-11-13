import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryNotifierProvider = NotifierProvider<SearchQueryNotifier, String>(() => SearchQueryNotifier());

class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  void updateSearchQuery(String query) {
    state = query.trim();
  }
}
