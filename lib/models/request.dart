import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_status.dart';
import 'package:first_project/enums/request_visibility.dart';
import 'package:first_project/models/user.dart';

class Request {
  final LeaveType type;
  final DateTime startDate;
  final DateTime endDate;
  final RequestVisibility visibility;
  final String reason;
  final User creator;
  RequestStatus status = RequestStatus.Pending;
  int get numberOfDays => endDate.difference(startDate).inDays;

  Request(this.startDate, this.endDate, this.type, this.visibility, this.reason, this.creator);
}
