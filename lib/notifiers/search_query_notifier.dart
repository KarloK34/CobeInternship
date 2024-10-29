import 'package:flutter/material.dart';

class SearchQueryNotifier extends ChangeNotifier {
  String _searchQuery = '';

  void updateSearchQuery(String query) {
    _searchQuery = query.trim();
    notifyListeners();
  }

  String get searchQuery => _searchQuery;
}


