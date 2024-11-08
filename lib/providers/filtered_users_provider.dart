import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/providers/selected_filters_notifier_provider.dart';
import 'package:first_project/providers/search_query_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final filteredUsersProvider = Provider((ref) {
  List<User> filteredUsers = [];
  final userBox = Hive.box<User>('userBox');
  final allUsers = userBox.values.toList();
  final selectedFilters = ref.watch(selectedFiltersNotifierProvider);
  final searchQuery = ref.watch(searchQueryNotifierProvider);
  filteredUsers = allUsers.where((user) {
    final fullname = '${user.name} ${user.surname}';

    final matchesSearch = fullname.toLowerCase().contains(searchQuery.toLowerCase());

    bool matchesFilter = selectedFilters.isEmpty ||
        selectedFilters.any((filter) {
          switch (filter) {
            case 'Online':
              return user.status == ConnectionStatus.online;
            case 'Offline':
              return user.status == ConnectionStatus.offline;
            case 'Sick':
              return user.currentLeaveType == LeaveType.sick;
            case 'Vacation':
              return user.currentLeaveType == LeaveType.vacation;
            case 'Parental':
              return user.currentLeaveType == LeaveType.parental;
            default:
              return false;
          }
        });
    return matchesSearch && matchesFilter;
  }).toList();

  return filteredUsers;
});
