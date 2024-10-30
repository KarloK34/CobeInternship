import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:first_project/enums/role.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/utilities/app_images.dart';
import 'package:flutter/material.dart';

final List<User> mockedUsers = [
  User('Karlo', 'Kraml', Role.Student, AppImages.dummyProfile, ConnectionStatus.Online, requests: [
    LeaveRequest(
      DateTime(2024, 10, 28),
      DateTime(2024, 11, 5),
      LeaveType.Sick,
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

class AllUsersNotifier extends ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    _users = mockedUsers;

    _isLoading = false;
    notifyListeners();
  }

  List<User> get allUsers => _users;
  bool get isLoading => _isLoading;
}
