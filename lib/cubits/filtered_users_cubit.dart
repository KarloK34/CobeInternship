import 'dart:async';
import 'package:first_project/cubits/all_users_cubit.dart';
import 'package:first_project/cubits/search_query_cubit.dart';
import 'package:first_project/cubits/selected_filters_cubit.dart';
import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteredUsersCubit extends Cubit<List<User>> {
  final AllUsersCubit allUsersCubit;
  final SelectedFiltersCubit selectedFiltersCubit;
  final SearchQueryCubit searchQueryCubit;

  late List<User> _allUsers;
  late Set<String> _selectedFilters;
  late String _searchQuery;

  late final StreamSubscription usersSubscription;
  late final StreamSubscription selectedFiltersSubscription;
  late final StreamSubscription searchQuerySubscription;

  FilteredUsersCubit({
    required this.allUsersCubit,
    required this.selectedFiltersCubit,
    required this.searchQueryCubit,
  }) : super([]) {
    _allUsers = allUsersCubit.state;
    _selectedFilters = selectedFiltersCubit.state;
    _searchQuery = searchQueryCubit.state;

    _filterUsers();

    usersSubscription = allUsersCubit.stream.listen(
      (allUsers) {
        _allUsers = allUsers;
        _filterUsers();
      },
    );
    selectedFiltersSubscription = selectedFiltersCubit.stream.listen(
      (selectedFilters) {
        _selectedFilters = selectedFilters;
        _filterUsers();
      },
    );
    searchQuerySubscription = searchQueryCubit.stream.listen(
      (searchQuery) {
        _searchQuery = searchQuery;
        _filterUsers();
      },
    );
  }
  void _filterUsers() {
    final filteredUsers = _allUsers.where((user) {
      final fullname = '${user.name} ${user.surname}';

      final matchesSearch = fullname.toLowerCase().contains(_searchQuery.toLowerCase());

      bool matchesFilter = _selectedFilters.isEmpty ||
          _selectedFilters.any((filter) {
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

    emit(filteredUsers);
  }

  @override
  Future<void> close() {
    usersSubscription.cancel();
    searchQuerySubscription.cancel();
    selectedFiltersSubscription.cancel();
    return super.close();
  }
}
