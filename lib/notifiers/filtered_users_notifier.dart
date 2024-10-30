import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/notifiers/all_users_notifier.dart';
import 'package:first_project/notifiers/filters_notifier.dart';
import 'package:first_project/notifiers/search_query_notifier.dart';
import 'package:flutter/material.dart';

class FilteredUsersNotifier extends ChangeNotifier {
  final AllUsersNotifier allUsersNotifier;
  final FiltersNotifier filtersNotifier;
  final SearchQueryNotifier searchQueryNotifier;
  List<User> _filteredUsers = [];

  FilteredUsersNotifier({
    required this.allUsersNotifier,
    required this.filtersNotifier,
    required this.searchQueryNotifier,
  }) {
    allUsersNotifier.addListener(_filterUsers);
    searchQueryNotifier.addListener(_filterUsers);
    filtersNotifier.addListener(_filterUsers);
    _filterUsers();
  }

  void _filterUsers() {
    final allUsers = allUsersNotifier.allUsers;

    _filteredUsers = allUsers.where((user) {
      final fullname = '${user.name} ${user.surname}';
      final searchQuery = searchQueryNotifier.searchQuery;
      final selectedFilters = filtersNotifier.selectedFilters;

      final matchesSearch = fullname.toLowerCase().contains(searchQuery.toLowerCase());

      bool matchesFilter = selectedFilters.isEmpty ||
          selectedFilters.any((filter) {
            switch (filter) {
              case 'Online':
                return user.status == ConnectionStatus.Online;
              case 'Offline':
                return user.status == ConnectionStatus.Offline;
              case 'Sick':
                return user.currentLeaveType == LeaveType.Sick;
              case 'Vacation':
                return user.currentLeaveType == LeaveType.Vacation;
              case 'Parental':
                return user.currentLeaveType == LeaveType.Parental;
              default:
                return false;
            }
          });
      return matchesSearch && matchesFilter;
    }).toList();

    notifyListeners();
  }

  @override
  void dispose() {
    allUsersNotifier.removeListener(_filterUsers);
    searchQueryNotifier.removeListener(_filterUsers);
    filtersNotifier.removeListener(_filterUsers);
    super.dispose();
  }

  List<User> get filteredUsers => _filteredUsers;
}
