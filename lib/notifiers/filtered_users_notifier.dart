import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/models/user.dart';
import 'package:flutter/material.dart';

class FilteredUsersNotifier extends ChangeNotifier {
  List<User> _filteredUsers = [];

  void filterUsers(List<User> allUsers, Set<String> selectedFilters, String searchQuery) {
    _filteredUsers = allUsers.where((user) {
      final fullname = '${user.name} ${user.surname}';

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

  List<User> get filteredUsers => _filteredUsers;
}
