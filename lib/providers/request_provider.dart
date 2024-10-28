import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:first_project/models/leave_request.dart';
import 'package:first_project/models/user.dart';
import 'package:flutter/material.dart';

class RequestProvider extends ChangeNotifier {
  final List<User> users;

  RequestProvider({required this.users}) {
    _initializeRequests();
  }
  List<LeaveRequest> _requests = [];

  List<LeaveRequest> get requests => _requests;

  void _initializeRequests() {
    _requests = [
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
    ];
    notifyListeners();
  }
}
