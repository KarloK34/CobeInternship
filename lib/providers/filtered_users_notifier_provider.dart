import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/providers/filters_notifier_provider.dart';
import 'package:first_project/providers/search_query_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final filteredUsersNotifierProvider = NotifierProvider<FilteredUsersNotifier, List<User>>(() => FilteredUsersNotifier());

class FilteredUsersNotifier extends Notifier<List<User>> {
  @override
  List<User> build() {
    final userBox = Hive.box<User>('userBox');
    final allUsers = userBox.values.toList();
    return allUsers;
  }

  void filterUsers() {
    final userBox = Hive.box<User>('userBox');
    final allUsers = userBox.values.toList();
    final selectedFilters = ref.read(filtersNotifierProvider);
    final searchQuery = ref.read(searchQueryNotifierProvider);
    state = allUsers.where((user) {
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
  }
}
