import 'package:first_project/enums/leave_request_status.dart';
import 'package:first_project/enums/leave_type.dart';
import 'package:first_project/enums/request_visibility.dart';

class LeaveRequest {
  final LeaveType type;
  final DateTime startDate;
  final DateTime endDate;
  final RequestVisibility visibility;
  final String reason;
  LeaveRequestStatus status = LeaveRequestStatus.Pending;

  LeaveRequest(
    this.startDate,
    this.endDate,
    this.type,
    this.visibility,
    this.reason,
  );

  int get numberOfDays => endDate.difference(startDate).inDays;
}
