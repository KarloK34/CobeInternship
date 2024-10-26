import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:first_project/enums/role.dart';
import 'package:first_project/models/request.dart';
import 'package:first_project/models/user.dart';
import 'package:first_project/utilities/app_images.dart';
import 'package:flutter/material.dart';

List<User> dummyUsers = [
  User('Karlo', 'Kraml', Role.Student, Image.asset(AppImages.dummyProfile), ConnectionStatus.Online),
  User('Davor', 'Štajcer', Role.Employee, Image.asset(AppImages.dummyProfile2), ConnectionStatus.Offline),
];
List<Request> dummyRequests = [
  Request(DateTime(2024, 10, 28), DateTime(2024, 11, 5), LeaveType.Sick, RequestVisibility.everyone, 'Flu', dummyUsers[0]),
  Request(DateTime(2024, 10, 30), DateTime(2024, 11, 1), LeaveType.Vacation, RequestVisibility.everyone, 'Flu', dummyUsers[0]),
  Request(DateTime(2024, 10, 25), DateTime(2024, 11, 12), LeaveType.Sick, RequestVisibility.everyone, 'Flu', dummyUsers[0]),
  Request(DateTime(2024, 10, 29), DateTime(2024, 11, 9), LeaveType.Vacation, RequestVisibility.everyone, 'Going to Dubai', dummyUsers[1]),
];
