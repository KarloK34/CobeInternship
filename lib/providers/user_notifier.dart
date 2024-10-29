import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:first_project/enums/role.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/utilities/app_images.dart';
import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier {
  final List<User> _users = [
    User('Karlo', 'Kraml', Role.Student, AppImages.dummyProfile, ConnectionStatus.Online, requests: [
      LeaveRequest(
        DateTime(2024, 10, 28),
        DateTime(2024, 11, 5),
        LeaveType.Sick,
        RequestVisibility.everyone,
        'Flu',
      ),
      LeaveRequest(
        DateTime(2024, 10, 30),
        DateTime(2024, 11, 1),
        LeaveType.Vacation,
        RequestVisibility.everyone,
        'Flu',
      ),
      LeaveRequest(
        DateTime(2024, 10, 29),
        DateTime(2024, 11, 9),
        LeaveType.Vacation,
        RequestVisibility.everyone,
        'Going to Dubai',
      ),
    ]),
    User(
      'Davor',
      'Štajcer',
      Role.Employee,
      AppImages.dummyProfile2,
      ConnectionStatus.Offline,
    ),
  ];
  String _searchQuery = '';
  final Set<String> _selectedFilters = {};
  List<User> _filteredUsers = [];

  UserNotifier() {
    _filteredUsers = _users;
  }

  void updateSearchQuery(String query) {
    _searchQuery = query.trim();
    _applyFilters();
  }

  void toggleFilter(String filter) {
    if (_selectedFilters.contains(filter)) {
      _selectedFilters.remove(filter);
    } else {
      _selectedFilters.add(filter);
    }
    _applyFilters();
  }

  void _applyFilters() {
    _filteredUsers = _users.where((user) {
      final fullname = '${user.name} ${user.surname}';
      final matchesSearch = fullname.toLowerCase().contains(_searchQuery.toLowerCase());

      bool matchesFilter = _selectedFilters.isEmpty ||
          _selectedFilters.any((filter) {
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

  List<User> get users => _filteredUsers;
  String get searchQuery => _searchQuery;
}
