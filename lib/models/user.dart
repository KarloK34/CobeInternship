import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/role.dart';
import 'package:first_project/models/leave_request.dart';

class User {
  final String name;
  final String surname;
  final Role role;
  final List<LeaveRequest> _requests = [];
  String profilePicture;
  ConnectionStatus status = ConnectionStatus.Offline;
  LeaveType? currentLeaveType;

  User(
    this.name,
    this.surname,
    this.role,
    this.profilePicture,
    this.status,
  );

  void toggleConnectionStatus() {
    status = status == ConnectionStatus.Offline ? ConnectionStatus.Online : ConnectionStatus.Online;
  }

  void createRequest(LeaveRequest request) {
    _requests.add(request);
  }

  List<LeaveRequest> get requests {
    return _requests;
  }
}
