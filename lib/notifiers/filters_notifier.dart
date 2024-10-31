import 'package:flutter/material.dart';

class FiltersNotifier extends ChangeNotifier {
  final Set<String> _selectedFilters = {};

  void toggleFilter(String filter) {
    if (_selectedFilters.contains(filter)) {
      _selectedFilters.remove(filter);
    } else {
      _selectedFilters.add(filter);
    }
    notifyListeners();
  }

  Set<String> get selectedFilters => _selectedFilters;
}
