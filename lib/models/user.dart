import 'package:first_project/enums/connection_status.dart';
import 'package:first_project/enums/role.dart';
import 'package:first_project/models/leave_request.dart';

class User {
  final String name;
  final String surname;
  final Role role;
  String profilePicture;
  ConnectionStatus _status = ConnectionStatus.Offline;
  List<LeaveRequest> requests;
  bool isAbsent = false;

  User(this.name, this.surname, this.role, this.profilePicture, this._status, {this.requests = const []});

  void toggleConnectionStatus() {
    _status = _status == ConnectionStatus.Offline ? ConnectionStatus.Online : ConnectionStatus.Online;
  }

  void createRequest(LeaveRequest request) {
    requests.add(request);
  }

  ConnectionStatus get status => _status;
  set status(ConnectionStatus newStatus) {
    _status = newStatus;
  }
}
