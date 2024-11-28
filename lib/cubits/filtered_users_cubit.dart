import 'dart:async';
import 'package:first_project/cubits/all_users_cubit.dart';
import 'package:first_project/cubits/search_query_cubit.dart';
import 'package:first_project/cubits/selected_filters_cubit.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/get_it/get_it.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/ui_components/shareable/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteredUsersCubit extends Cubit<List<User>> {
  final SelectedFiltersCubit selectedFiltersCubit;
  final SearchQueryCubit searchQueryCubit;

  late List<User> _allUsers;
  late Set<String> _selectedFilters;
  late String _searchQuery;

  late final StreamSubscription usersSubscription;
  late final StreamSubscription selectedFiltersSubscription;
  late final StreamSubscription searchQuerySubscription;

  FilteredUsersCubit({
    required this.selectedFiltersCubit,
    required this.searchQueryCubit,
  }) : super([]) {
    final usersState = getIt<AllUsersCubit>().state;
    _allUsers = (usersState is SuccessState<List<User>> ? usersState.data : <User>[]) ?? <User>[];
    _selectedFilters = selectedFiltersCubit.state;
    _searchQuery = searchQueryCubit.state;

    _filterUsers();

    usersSubscription = getIt<AllUsersCubit>().stream.listen(
      (state) {
        final users = state is SuccessState<List<User>> ? state.data : <User>[];
        _allUsers = users ?? [];
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
      final fullname = user.name;

      final matchesSearch = fullname.toLowerCase().contains(_searchQuery.toLowerCase());

      bool matchesFilter = _selectedFilters.isEmpty ||
          _selectedFilters.any((filter) {
            switch (filter) {
              case 'Online':
                return user.isOnline;
              case 'Offline':
                return !user.isOnline;
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
